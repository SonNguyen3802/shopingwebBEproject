const express = require('express')
const morgan = require('morgan')
const helmet = require('helmet') // security
const cors = require('cors')
const session = require('express-session')
require('dotenv').config()
require('./passport')
const passport = require('passport')

// Router
import { authRouter, productRouter, userRouter } from './route'


const app = express()

app.use(cors({
    origin: process.env.URL_REACT_APP,
    credentials: true
}))


app.use(helmet())
// app.use(morgan('dev'))
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(express.static(`${__dirname}/public`))

// init passport
app.use(passport.initialize())
// thiết lập session
app.use(session({
    secret: 'hip06',
    resave: false,
    saveUninitialized: false,
    cookie: { secure: false }
}))
// cho phép passport lấy cookie-session sau đó mã hóa thành data => chạy dô hàm deserializeUser
app.use(passport.session())

// Route hander
app.use('/api/v1/users', userRouter)
app.use('/api/v1/products', productRouter)
app.use('/api/v1/auth', authRouter)
// app.use('/api/v1/admins',adminRouter)
module.exports = app
