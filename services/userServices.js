import { updatePassword } from '../controller/authController'

const db = require('../models/index')

export const updateService = async (body, userId) => {
  return new Promise((resolve,reject) => {
    try{
      db.User.update({
        username: body.username,
        email: body.email,
        phone: body.phone,
        address: body.address
      }, { where: { id: userId } })
      resolve()
    }catch(err){
      reject(err)
    }
  })
}


export const getCurrentUser = async (userId) => {
  let currentUser = await db.User.findOne({where: {id: userId}})
  let user = {
    username: currentUser.username,
    email: currentUser.email,
    phone: currentUser.phone,
    address: currentUser.address
  }
  return user
}
