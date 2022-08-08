'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class PhonesCategory extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  PhonesCategory.init({
    screenSize: DataTypes.STRING,
    screenTechnology: DataTypes.STRING,
    cameraBack: DataTypes.STRING,
    cameraFont: DataTypes.STRING,
    chipset: DataTypes.STRING,
    ram: DataTypes.STRING,
    rom: DataTypes.STRING,
    battery: DataTypes.STRING,
    OS: DataTypes.STRING,
    screenResolution: DataTypes.STRING,
    screenFeature: DataTypes.STRING,
    weight: DataTypes.STRING,
    bluetooth: DataTypes.STRING,
    refreshRate: DataTypes.STRING,
    product_id: DataTypes.INTEGER,
    quantity: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'PhonesCategory',
  });
  return PhonesCategory;
};
