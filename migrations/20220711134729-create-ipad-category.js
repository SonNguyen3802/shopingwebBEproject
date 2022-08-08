'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('IpadCategories', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      STT:{
        type: Sequelize.INTEGER
      },
      categoryId:{
        type: Sequelize.INTEGER,
        references: {
          model: 'Categories',
          key: 'id'
        }
      },
      screenSize: {
        type: Sequelize.STRING
      },
      screenTechnology: {
        type: Sequelize.STRING
      },
      cameraBack: {
        type: Sequelize.STRING
      },
      cameraFont: {
        type: Sequelize.STRING
      },
      chipset: {
        type: Sequelize.STRING
      },
      ram: {
        type: Sequelize.STRING
      },
      rom: {
        type: Sequelize.STRING
      },
      OS: {
        type: Sequelize.STRING
      },
      screenResolution: {
        type: Sequelize.STRING
      },
      screenFeatures: {
        type: Sequelize.STRING
      },
      CPU: {
        type: Sequelize.STRING
      },
      weight: {
        type: Sequelize.STRING
      },
      bluetooth: {
        type: Sequelize.STRING
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
    await queryInterface.dropTable('IpadCategories');
  }
};
