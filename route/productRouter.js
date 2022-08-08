const router = require('express').Router()
const productController = require('../controller/productController')

router.get('/product',productController.getProductById)
router.get('/',productController.getAllProduct);

module.exports = router
