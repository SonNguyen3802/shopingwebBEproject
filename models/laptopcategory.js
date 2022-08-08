'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class LaptopCategory extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  LaptopCategory.init({
    CPU: DataTypes.STRING,
    VGA: DataTypes.STRING,
    ram: DataTypes.STRING,
    ramType: DataTypes.STRING,
    ramSlots: DataTypes.STRING,
    hardDisk: DataTypes.STRING,
    screenSize: DataTypes.STRING,
    screenResolution: DataTypes.STRING,
    ports: DataTypes.STRING,
    OS: DataTypes.STRING,
    weight: DataTypes.STRING,
    screenTechnology: DataTypes.STRING,
    STT: DataTypes.INTEGER,
    quantity: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'LaptopCategory',
  });
  return LaptopCategory;
};
