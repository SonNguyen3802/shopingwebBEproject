import nodemailer from 'nodemailer'
require('dotenv').config()

const sendEmailHandler = async (email, token, userId, name) => {
    let transporter = nodemailer.createTransport({
        host: process.env.EMAIL_HOST,
        port: process.env.EMAIL_PORT,
        secure: true, // true for 465, false for other ports
        auth: {
            user: process.env.EMAIL_USERNAME,
            pass: process.env.EMAIL_PASSWORD,
        },
    });


    let info = await transporter.sendMail({
        from: '"Motion Tech 👻"<motion.tech.nofity@gmail.com',
        to: email,
        subject: "Xác nhận bảo mật",
        html: `<h3>Xin chào ${name},</h3>
        <p>Chúng tôi nhận được yêu cầu thay đổi mật khảu tài khoản của bạn. Nếu đó là bạn hãy bấm vào link đính kèm để xác nhận, nếu không phải bạn hãy đổi maatk khẫu ngay.</p>
        <a href="${process.env.URL_REACT_APP}/verify-token?userId=${userId}&token=${token}">Click here đồng ý đổi mật khẩu</a>
        <br />
        <b>Trân trọng</b>
        <p>Motion Tech Team</p>`,
    });
    return info
}

export default sendEmailHandler