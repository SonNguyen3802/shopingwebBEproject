import * as authServices from '../services/authServices'

// SIGN UP
export const signup = async (req, res) => {
  const { body } = req
  try {
    // CHECK PAYLOAD FROM FE HERE
    if (!(body.email || body.phone) || !body.pass)
      return res.status(403).json({
        status: 3,
        data: 'Missing inputs'
      })
    let response = await authServices.signupService(body)
    return res.status(201).json(response)
  }
  catch (err) {
    return res.status(403).json({
      status: -1,
      data: err
    })
  }
}
// LOGIN 
export const login = async (req, res) => {
  const { body } = req
  try {
    if (!(body.email || body.phone) || !body.pass) {
      return res.status(403).json({
        status: 3,
        data: 'Missing inputs'
      })
    }
    const response = await authServices.loginService(body)
    return res.status(200).json(response)
  } catch (err) {
    res.status(403).json({
      status: -1,
      data: err
    })
  }
}
// LOGIN SUCCESS
export const loginSuccess = async (req, res) => {
  const { query } = req
  try {
    if (!query.id) {
      return res.status(403).json({
        status: 3,
        data: 'Missing inputs'
      })
    }
    const response = await authServices.loginSuccessService(query.id)
    return res.status(200).json(response)
  } catch (err) {
    res.status(403).json({
      status: -1,
      data: err
    })
  }
}

// SEND MAIL AFTER LOGIN PASS
export const sendEmail = async (req, res) => {
  const { user, body } = req
  try {
    if (!user.userId || !body.email || !body.name || !body.pass) {
      return res.status(403).json({
        status: 3,
        data: 'Missing inputs'
      })
    }
    let response = await authServices.sendEmailService(user.userId, body)
    return res.status(200).json(response)
  } catch (err) {
    res.status(403).json({
      status: 'fail',
      data: err
    })
  }
}
// VERIFY EMAIL
export const verifyEmail = async (req, res) => {
  const { query } = req
  try {
    if (!query.userId || !query.token) {
      return res.status(403).json({
        status: 3,
        data: 'Missing inputs'
      })
    }
    let response = await authServices.verifyEmailService(query)
    return res.status(200).json(response)
  } catch (err) {
    res.status(403).json({
      status: 'fail',
      data: err
    })
  }
}
// UPDATE PASSWORD
export const updatePassword = async (req, res) => {
  const { body, user } = req
  try {
    if (!user.userId || !body.pass) {
      return res.status(403).json({
        status: 3,
        data: 'Missing inputs'
      })
    }
    let response = await authServices.updatePasswordService(user.userId, body)
    return res.status(200).json(response)
  } catch (err) {
    res.status(403).json({
      status: 'fail',
      data: err
    })
  }
}

