const db = require('../models/index')
const productServices = require('../services/productServices')
const fs = require('fs')

exports.getAllProduct = async (req, res) => {
    try {
      let page = (req.query['page'] !== 0 && /^\d+$/.test(req.query['page'])) ? req.query['page'] : 1
      let labelDefault = await db.Labels.findOne({where: {id: 1}})
      let categoryDefault = await db.Categories.findOne({where: {id: 1}})
      let label = req.query['label'] ? req.query['label'] : labelDefault.name
      let category = req.query['category'] ? req.query['category'] : categoryDefault.name
      const productRequested = await productServices.getAllProducts(page,label,category)
      const allProducts = productRequested[0]
      const products_quantity = productRequested[1]
      console.log(products_quantity)
      return res.status(200).json({
          status: "success",
          dataProduct: allProducts,
          productsQuantity: products_quantity
      })
    } catch (err) {
        res.status(404).json({
            status: 'fail',
            message: err
        })
    }
}

exports.getProductById = async (req,res) => {
  try{
    if(/^\d+$/.test(req.query['id'])){
      let id = req.query['id']
      const product = await productServices.getProductById(id)
      return res.status(200).json({
        status: "success",
        dataProduct: product
      })
    }else{
      res.status(404).json({
          status: 'fail',
          message: 'Invalid Product Id'
      })
    }
  }catch(err){
    res.status(404).json({
        status: 'fail',
        message: err
    })
  }
}
