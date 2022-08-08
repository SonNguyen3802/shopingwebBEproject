import passport from 'passport';
import db from './models'

const GoogleStrategy = require('passport-google-oauth20').Strategy;
const FacebookStrategy = require('passport-facebook').Strategy;
require('dotenv').config()

// GOOGLE
passport.use(new GoogleStrategy({
    clientID: process.env.GOOGLE_CLIENT_ID,
    clientSecret: process.env.GOOGLE_CLIENT_SECRET,
    callbackURL: "/api/v1/auth/google/callback",
},
    async function (accessToken, refreshToken, profile, done) {
        if (profile?.id) {
            await db.User.findOrCreate({
                where: { id: profile.id },
                defaults: {
                    id: profile.id,
                    email: profile.emails[0]?.value || null,
                    username: profile.displayName || null,
                    typeLogin: 'google',
                    roleId: 1
                }
            })
        }
        done(null, profile)
    }
));
// FACEBOOK ?
passport.use(new FacebookStrategy({
    clientID: process.env.FACEBOOK_APP_ID,
    clientSecret: process.env.FACEBOOK_APP_SECRET,
    callbackURL: "/api/v1/auth/facebook/callback",
    profileFields: ['id', 'displayName', 'email']
},
    async function (accessToken, refreshToken, profile, cb) {
        if (profile?.id) {
            await db.User.findOrCreate({
                where: { id: profile.id },
                defaults: {
                    id: profile.id,
                    email: profile.emails[0]?.value || null,
                    username: profile.displayName || null,
                    typeLogin: 'facebook',
                    roleId: 1
                }
            })
        }
        return cb(null, profile);
    }
));


passport.serializeUser((user, done) => {
    done(null, '')
})
passport.deserializeUser((user, done) => {
    done(null, '')
})