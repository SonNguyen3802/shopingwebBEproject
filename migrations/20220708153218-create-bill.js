'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Bills', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      customerId: {
        type: Sequelize.STRING,
        references: {
          model: 'Users',
          key: 'id'
        }
      },
      receiverName: {
        type: Sequelize.STRING,
        charset: 'utf8',
        collate: 'utf8_general_ci'
      },
      receiverAddress: {
        type: Sequelize.STRING,
        charset: 'utf8',
        collate: 'utf8_general_ci'
      },
      receiverPhone: {
        type: Sequelize.STRING,
        validate: {
          min: 10,
          max: 10
        }
      },
      status: {
        type: Sequelize.ENUM(['waiting', 'on process', 'finish']),
        defaultValue: 'waiting'
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Bills');
  }
};
