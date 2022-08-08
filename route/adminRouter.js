const express = require('express')
const adminController = require('../controller/adminController')
const router = express.Router()

/*
// Manage Product

router.get('/products',adminController.getAllProducts)
router.get('/product/:id',adminController.getProductById)


// User will choose category first
// From category BE code will render ProductDetail
router.post('/product/:category',adminController.productDetailInfo)
router.post('/addProduct/',adminController.addProduct)

//router.patch('/updateProduct/:id',adminController.updateProduct)
//router.delete('/deleteProduct/:id',adminController.deleteProduct)

// ---------------------------


//Manage Account

router.get('/users',adminController.getAllUsers)
router.get('/user/:id',adminController.getUserById)
//router.patch('/updateUser/:id', adminController.updateUser)
router.delete('/deleteUser/:id', adminController.deleteUser)

// ---------------------------


// Manage bill

router.get('/bills', adminController.getAllBills)
router.get('/bill/:id', adminController.getBillById)
//router.patch('/updateBill/:id',adminController.updateBill)

// ---------------------------

*/