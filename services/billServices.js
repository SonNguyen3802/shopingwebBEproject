const db = require('../models/index')

exports.createBill = async(customerId,body) => {
  const bill = await db.Bill.create({
    customerId: customerId,
    receiverName: body.receiverName,
    receiverPhone: body.receiverPhone,
    receiverAddress: body.receiverAddress
  })
  return bill
}

exports.createBillDetail = async(billId,productId,quantity,totalPrice)=>{
  const productDetail = await db.BillProduct.create({
    billId: billId,
    productId: productId,
    quantity: quantity,
    totalPrice: totalPrice
  })
  return productDetail
}

exports.deleteBill = async(id)=>{
  await db.Bill.destroy({where: {id: id}})
}

exports.deleteBillDetail = async(id) => {
  await db.BillProduct.destroy({where: {id: id}})
}

module.exports
