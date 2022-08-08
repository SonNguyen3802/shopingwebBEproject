import jwt from 'jsonwebtoken'

export const protect = async (req, res, next) => {
    try {
        // 1) Get token and check
        let token
        if (req.headers['access-token'] && req.headers['access-token'].startsWith('Bearer')) {
            token = req.headers['access-token'].split(' ')[1]
        }
        if (!token) {
            return res.status(403).json({
                status: 'fail',
                err: 'Bạn chưa đăng nhập Vui lòng đăng nhập'
            })
        }
        // 2) Verify token
        await jwt.verify(token, process.env.JWT_SECRET, (err, decode) => {
            if (err) return res.status(401).json({
                status: 2,
                err: 'Auth failed !'
            })
            req.user = decode
        })
        next()
    }
    catch (err) {
        console.log(err)
    }
}

