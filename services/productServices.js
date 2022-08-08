const db = require('../models/index')

exports.getProductById = async(id) => {
  const product = await db.Products.findOne({where: {id: id}})
  return product
}

exports.updateProduct = async(id,quantity) => {
  return new Promise((resolve,reject) => {
    try{
      db.Products.update({
        quantity: quantity
      },{where:{id: id}})
      resolve()
    }catch(err){
      reject(err)
    }
  })
}

exports.getAllProducts = async(page,thisLabel) => {
  const productLimit = 20
  const offset = (page - 1) * productLimit
  const label = await db.Labels.findOne({where: {name: thisLabel}})
  const allProducts = await db.Products.findAll({
    include:[
      {model: db.Categories,as:'Categories',attributes:['name']},
      {model: db.Labels,as:'Labels',attributes:['name']}
    ],
    raw: true,
    nested: true,
    where: {
      labelId: label.id,
    },
    limit: productLimit,
    offset: offset
  })
  let products = {}
  for(let product of allProducts){
    let category = product['Categories.name']
    let label = product['Labels.name']
    if(products[category] === undefined) products[category] = {}
    if(products[category][label] === undefined) products[category][label] = []
    products[category][label].push(product)
  }
  return products
}

module.exports
