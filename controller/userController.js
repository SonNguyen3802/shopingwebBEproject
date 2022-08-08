const db = require('../models/index')
const userServices = require('../services/userServices')
const productServices = require('../services/productServices')
const billServices = require('../services/billServices')
// Update Me
exports.updateMe = async (req, res) => {
  try {
    const user = req.user
    userServices.updateService(req.body, user.userId)
    .then(()=>{
      res.status(200).json({
        status: 'success',
      })
    })
  } catch (err) {
    res.status(403).json({
      status: 'fail',
      data: {
        err
      }
    })
    console.log(err)
  }
}

exports.getCurrentUser = async(req,res) => {
  try{
    const user = req.user
    //console.log(user)
    const currentUser = await userServices.getCurrentUser(user.userId)
    res.status(200).json({
      status: 'success',
      data: {
        currentUser
      }
    })
  }catch(err){
    res.status(403).json({
      status: 'fail',
      data: {
        err
      }
    })
    console.log(err)
  }
}

exports.buyProduct = async (req, res) => {
  // Receive Information from Bill Form
  try{
    const { receiverName, receiverPhone, receiverAddress } = req.body
    const billItem = {
      'receiverName': req.body.receiverName,
      'receiverPhone': req.body.receiverPhone,
      'receiverAddress': req.body.receiverAddress,
    }
    let quantityCheck = false
    let billDetail
    let product
    let bill

    billServices.createBill(req.user.userId, billItem)
    .then(async ()=>{
      bill = await db.Bill.findOne({where: {
        customerId: req.user.userId,
        receiverName: req.body.receiverName,
        receiverPhone: req.body.receiverPhone,
        receiverAddress: req.body.receiverAddress
      }})
      if (bill) {
        product = await productServices.getProductById(req.body.id)
        if (product) {
          const totalPrice = product.price * req.body.quantity
          billDetail = await billServices.createBillDetail(bill.id, product.id, req.body.quantity, totalPrice)
          if (billDetail) {
            await productServices.updateProduct(product.id,product.quantity-req.body.quantity)
            quantityCheck = true
          } else {
            await billServices.deleteBill(bill.id)
            //console.log(1)
            return res.status(404).json({
              status: 'fail',
              data: 'ERROR'
            })
          }
        } else {
          await billServices.deleteBill(bill.id)
          //console.log(2)
          return res.status(404).json({
            status: 'fail',
            data: 'ERROR'
          })
        }
      } else {
        //console.log(3)
        return res.status(404).json({
          status: 'fail',
          data: 'ERROR'
        })
      }
    })
  }catch(err){
    if(bill !== null) await billServices.deleteBill(bill.id)
    if(quantityCheck) product.quantity += req.body.quantity
    if(billDetail !== null) await billServices.deleteBillDetail(billDetail.id)
    console.log(err)
  }
}

/*
export const getCurrentUser = (req, res) => res.status(200).json({
  isSucess: true,
  msg: 'Đăng nhập thành công',
  data: req.user
})
*/
