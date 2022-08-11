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

exports.getAllProducts = async(page,thisLabel,thisCategory) => {
  const productLimit = 20
  const offset = (page - 1) * productLimit
  const label = await db.Labels.findOne({where: {name: thisLabel}})
  const category = await db.Categories.findOne({where: {name: thisCategory}})
  /*const renderProducts = await db.Products.findAll({
    include:[
      {model: db.Categories,as:'Categories',attributes:['name']},
      {model: db.Labels,as:'Labels',attributes:['name']}
    ],
    raw: true,
    nested: true,
    where: {
      labelId: label.id,
      categoryId: category.id
    },
    limit: productLimit,
    offset: offset
  })*/
  let [renderProducts,products_quantity] = await Promise.all([
    await db.Products.findAll({
      include:[
        {model: db.Categories,as:'Categories',attributes:['name']},
        {model: db.Labels,as:'Labels',attributes:['name']}
      ],
      raw: true,
      nested: true,
      where: {
        labelId: label.id,
        categoryId: category.id
      },
      limit: productLimit,
      offset: offset
    }),
    await db.Products.findAll({
      include:[
        {model: db.Categories,as:'Categories',attributes:['name']},
        {model: db.Labels,as:'Labels',attributes:['name']}
      ],
      raw: true,
      nested: true,
      where: {
        labelId: label.id,
        categoryId: category.id
      }
    })
  ])
  let products = {}
  for(let product of renderProducts){
    let category = product['Categories.name']
    let label = product['Labels.name']
    if(products[category] === undefined) products[category] = {}
    if(products[category][label] === undefined) products[category][label] = []
    products[category][label].push(product)
  }
  return [products,products_quantity.length]
}

module.exports
