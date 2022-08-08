'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Bill extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Bill.init({
    customerId: DataTypes.STRING,
    receiverName: DataTypes.STRING,
    receiverAddress: DataTypes.STRING,
    receiverPhone: DataTypes.STRING,
    status: DataTypes.ENUM(['waiting', 'on process', 'finish'])
  }, {
    sequelize,
    modelName: 'Bill',
  });
  return Bill;
};
