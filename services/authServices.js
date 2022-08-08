import db from '../models'
import jwt from 'jsonwebtoken'
require('dotenv').config()
import bcrypt from 'bcryptjs'
import { v4 as uuidv4 } from 'uuid'
import sendEmailHandler from './sendEmail'


// ENCODE USER ID + ROLE ID TO JWT
const signToken = dataEncode => jwt.sign(dataEncode, process.env.JWT_SECRET, { expiresIn: process.env.JWT_EXPIRES_IN })
const salt = bcrypt.genSaltSync(12)
const hashPassword = password => bcrypt.hashSync(password, salt)

// SIGN UP
export const signupService = ({ email, pass, phone }) => new Promise(async (resolve, reject) => {
    try {
        const queryCondition = email ? { email } : { phone }
        const response = await db.User.findOrCreate({
            where: queryCondition,
            defaults: {
                ...queryCondition,
                password: hashPassword(pass),
                id: uuidv4(),
                roleId: 1
            },
            raw: true,
        })
        console.log(response);
        const token = response[1] && signToken({ userId: response[0].id, roleId: response[0].roleId })
        const { password, ...user } = response[1] ? response[0].dataValues : response[0]
        resolve({
            status: response[1] ? 0 : 4,
            data: response[1] ? { user, token } : 'Tài khoản đã tồn tại !'
        })
    } catch (error) {
        reject(error)
    }
})
// LOGIN
export const loginService = async ({ email, pass, phone }) => new Promise(async (resolve, reject) => {
    try {
        const queryCondition = email ? { email } : { phone }
        const response = await db.User.findOne({
            where: queryCondition,
            raw: true
        })
        const isCorrectPassword = response && response.password && bcrypt.compareSync(pass, response.password)
        const token = response?.id && signToken({ userId: response.id, roleId: response.roleId })
        if (response) delete response.password
        resolve({
            status: !response ? 1 : !isCorrectPassword ? 2 : 0,
            data: !response ? 'Email hoặc số điện thoại chưa được đăng ký' : !isCorrectPassword ? 'Sai mật khẩu' : { user: response, token }
        })

    } catch (error) {
        reject(error)
    }
})
// LOGIN SUCCESS
export const loginSuccessService = async (id) => new Promise(async (resolve, reject) => {
    try {
        const response = await db.User.findOne({
            where: { id },
            raw: true
        })
        const token = response?.id && signToken({ userId: response.id, roleId: response.roleId })
        if (response) delete response.password
        resolve({
            status: response ? 0 : 1,
            data: token
        })

    } catch (error) {
        reject(error)
    }
})
// CHANGE PASSWORD 
/*
Idea:
1. Client call api login. Login success => Server gererate 1 token A => save table user => next step 2
2. emailService : add 1 link type exxample: http://localhost:3000/verify-token?token=${A}&userId=${userId}
(this route is defined by Component Verify from FE, in component call api to check token and userId)
3. User check mail => click link redirect to Component Verify
4. When mounted component Verify, cal api with payload {userId, token} which got from params
5. BE check and send response
*/
export const sendEmailService = (userId, { email, name, pass }) => new Promise(async (resolve, reject) => {
    try {
        let response = await db.User.findOne({
            where: { id: userId },
            raw: true
        })
        const isCorrectPassword = response && response.password && bcrypt.compareSync(pass, response.password)
        const tokenChangePass = uuidv4()
        if (response && isCorrectPassword) {
            let [resUpdate, resEmail] = await Promise.all([
                db.User.update({ tokenChangePass }, {
                    where: { id: userId }
                }),
                sendEmailHandler(email, tokenChangePass, userId, name)
            ])
            resolve({
                status: 0,
                data: { resUpdate, resEmail }
            })
        }
    } catch (error) {
        reject(error)
    }
})
// VERIFY EMAIL
export const verifyEmailService = ({ userId, token }) => new Promise(async (resolve, reject) => {
    try {
        let response = await db.User.findOne({
            where: { id: userId, tokenChangePass: token }
        })
        response ? resolve({
            status: 0,
            data: 'Verify succeed !'
        }) : resolve({
            status: 2,
            data: 'Verify failed !'
        })
    } catch (error) {
        reject(error)
    }
})
// UPDATE PASSWORD
export const updatePasswordService = (id, { pass }) => new Promise(async (resolve, reject) => {
    try {
        await db.User.update({
            password: hashPassword(pass, salt)
        }, {
            where: { id }
        })
        resolve({
            status: 0,
            data: 'Change password succeed !'
        })
    } catch (error) {
        reject(error)
        console.log(err)
    }
})

