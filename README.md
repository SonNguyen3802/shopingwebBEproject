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
    UpdatePassword: POST -> http://localhost:8888/api/v1/auth/update-password (receive pass)
  *) Products: http://localhost:8888/api/v1/products (parameter: page, label)
     getProduct: http://localhost:8888/api/v1/products/product (parameter: id)
