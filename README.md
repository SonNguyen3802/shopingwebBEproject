+) DB: Download sql file and open in XAMPP
  1) Open XAMPP and start APACHE server and MYSQL
  2) In browser, type: http://localhost/phpmyadmin
  3) New -> Look at Create database -> Database name, type: shopingwebdb -> Create
  4) shopingwebdb -> Import -> File to import -> Choose file shopingwebdb.sql -> Import

+) BE CODE:
  *) Package required: dotenv, cors, morgan, helmet, express
     Install cmd: npm i dotenv cors morgan helmet express @babel/core @babel/node @babel/preset-env
  *) Cmd run BE code: npm run start  

+) Route:
  *) User: http://localhost:8888/api/v1/users
     getUserProfile: GET -> http://localhost:8888/api/v1/users/currentUser 
     UpdateProfile: POST -> http://localhost:8888/api/v1/users/updateMe (receive username,email,address,phone)
                    exp: <input value name>
     sendBuyRequest: POST -> http://localhost:8888/api/v1/users/buyProduct (receive receiverName, receiverPhone, receiverAddress, quantity, id); quantity and id are product's property
  *) Auth: http://localhost:8888/api/v1/auth
    Signup: POST -> http://localhost:8888/api/v1/auth/signup
    Login:  POST -> http://localhost:8888/api/v1/auth/login
    token format for client to call api: req['access-token'] = Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiMTVhMzhjNS03MGE3LTRiZWYtODI3ZS04NWVlY2ExOTcxNzYiLCJyb2xlSWQiOjEsImlhdCI6MTY1OTk2ODcxMiwiZXhwIjoxNjY3NzQ0NzEyfQ.rFKQmFHnzQp_zEU9mq2oiOF2PSUdLO_rsU0bZIhpzG8
  *) Products: http://localhost:8888/api/v1/products (parameter: page, label)
     getProduct: http://localhost:8888/api/v1/products/product (parameter: id)

  *) Oauth: 1) GET -> http://localhost:8888/api/v1/auth/google (client will get profile id)
            Sau bước 1, client sẽ redirect tới trang: http://localhost:3000/login-success/profile id (chính là profile id vừa mới nhận được sau get request)
            2) Từ trang http://localhost:3000/login-success/profile id thực hiện request: GET -> http://localhost:8888/api/v1/auth/login-success?id=profile id (lúc này client sẽ nhận được token để thực hiện hoạt động signup, signin)
            3) Redirect ra trang home

  *) Change Password:
            Step 1: POST -> http://localhost:8888/api/v1/auth/send-email (receive email, name, pass, token)
               Khách hàng sẽ click trực tiếp vào link vừa nhận được qua gmail (link có dạng: http://localhost:3000/verify-token/:token/:userId)

            Step 2: Từ trang http://localhost:3000/verify-token/:token/:userId(userID + tokenchangepass ở url) client sẽ gửi request tới: http://localhost:8888/api/v1/auth/verify-email?userId=${userId}&token=${token}, sau khi check thành công sẽ redirect đến form thay đổi mật khẩu.

            Step 3: POST -> http://localhost:8888/api/v1/auth/update-password (receive pass)