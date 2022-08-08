'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Products extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Products.belongsTo(models.Categories,{as:'Categories',foreignKey: 'categoryId'})
      Products.belongsTo(models.Labels,{as:'Labels',foreignKey: 'labelId'})
    }
  }
  Products.init({
    productName: DataTypes.STRING,
    price: DataTypes.INTEGER,
    quantity: DataTypes.INTEGER,
    image1: DataTypes.STRING,
    image2: DataTypes.STRING,
    image3: DataTypes.STRING,
    labelId: DataTypes.INTEGER,
    categoryId: DataTypes.INTEGER,
    description: DataTypes.INTEGER,
    STT: DataTypes.INTEGER,
  }, {
    sequelize,
    modelName: 'Products',
  });
  return Products;
};
