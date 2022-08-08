import * as productServices from '../services/productServices.js'

export const getAllProducts = async (req,res) => {
  try{
    const products = await productServices.getAllProducts
    res.status(200).json({
      dataProduct: products
    })
  }catch(err){
    res.status(404).json({
      status: -1,
      error: err
    })
  }
}

export const getProductById = async (req,res) => {
  try{
    const product = await productServices.getProductById(req.params['id'])
    res.status(200).json({
      dataProduct: products
    })
  }catch(err){
    res.status(404).json({
      status: -1,
      message: err
    })
  }
}

export const productDetailInfo = async(req,res) => {

}

export const addProduct = async (req,res) => {
  try{
    let category = req.params['category']
    //let {name,price,image1,label,category,description,productDetail} = req.body
    await productServices.addProduct(req.body)
  }catch(err){
    res.status(404).json({
      status: -1,
      error: err
    })
  }
}
