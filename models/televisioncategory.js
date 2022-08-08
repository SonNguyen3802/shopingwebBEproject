'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class TelevisionCategory extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  TelevisionCategory.init({
    screenSize: DataTypes.STRING,
    imageTechnology: DataTypes.STRING,
    screenResolution: DataTypes.STRING,
    screenType: DataTypes.STRING,
    refreshRate: DataTypes.STRING,
    televisionType: DataTypes.STRING,
    audioTechnology: DataTypes.STRING,
    OS: DataTypes.STRING,
    label: DataTypes.STRING,
    feature: DataTypes.STRING,
    STT: DataTypes.INTEGER,
    quantity: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'TelevisionCategory',
  });
  return TelevisionCategory;
};
