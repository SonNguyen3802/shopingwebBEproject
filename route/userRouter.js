const router = require('express').Router()
const userController = require('../controller/userController')
import { protect } from '../middleware/checkToken'

router.use(protect)
router.get('/currentUser',userController.getCurrentUser)
router.post('/updateMe',userController.updateMe)
router.post('/buyProduct',userController.buyProduct)

module.exports = router
