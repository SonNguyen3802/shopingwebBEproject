import express from 'express'
import * as authController from '../controller/authController'
import { protect } from '../middleware/checkToken'
import passport from 'passport'
require('dotenv').config()

const router = express.Router()

router.post('/signup', authController.signup)
router.post('/login', authController.login)
router.get('/login-success', authController.loginSuccess)
router.post('/send-email', protect, authController.sendEmail)
router.get('/verify-email', authController.verifyEmail)
router.post('/update-password', protect, authController.updatePassword)

// OAUTH GOOGLE
router.get('/google', passport.authenticate('google', { scope: ['email', 'profile'] }))
router.get('/google/callback', function (req, res, next) {
    passport.authenticate('google', function (err, user) {
        if (err) { return next(err) }
        if (!user) { return res.redirect('/login') }
        req.user = user
        next()
    })(req, res, next)
}, (req, res) => {
    res.redirect(`${process.env.URL_REACT_APP}/login/${req.user.id}`);
})

// OAUTH FACEBOOK
router.get('/facebook', passport.authenticate('facebook', { scope: ['email'] }))
router.get('/facebook/callback', function (req, res, next) {
    passport.authenticate('facebook', function (err, user) {
        if (err) { return next(err) }
        if (!user) { return res.redirect('/login') }
        req.user = user
        next()
    })(req, res, next)
}, (req, res) => {
    res.redirect(`${process.env.URL_REACT_APP}/login/${req.user.id}`);
})

export default router
