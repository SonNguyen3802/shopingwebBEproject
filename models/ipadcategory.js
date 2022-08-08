'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class IpadCategory extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  IpadCategory.init({
    screenSize: DataTypes.STRING,
    screenTechnology: DataTypes.STRING,
    cameraBack: DataTypes.STRING,
    cameraFont: DataTypes.STRING,
    chipset: DataTypes.STRING,
    ram: DataTypes.STRING,
    rom: DataTypes.STRING,
    OS: DataTypes.STRING,
    screenResolution: DataTypes.STRING,
    screenFeatures: DataTypes.STRING,
    CPU: DataTypes.STRING,
    weight: DataTypes.STRING,
    bluetooth: DataTypes.STRING,
    STT: DataTypes.INTEGER,
    quanity: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'IpadCategory',
  });
  return IpadCategory;
};
