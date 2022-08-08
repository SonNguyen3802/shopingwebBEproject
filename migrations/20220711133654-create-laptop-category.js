'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('LaptopCategories', {
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
      CPU: {
        type: Sequelize.STRING
      },
      VGA: {
        type: Sequelize.STRING
      },
      ram: {
        type: Sequelize.STRING
      },
      ramType: {
        type: Sequelize.STRING
      },
      ramSlots: {
        type: Sequelize.STRING
      },
      hardDisk: {
        type: Sequelize.STRING
      },
      screenSize: {
        type: Sequelize.STRING
      },
      screenResolution: {
        type: Sequelize.STRING
      },
      ports: {
        type: Sequelize.STRING
      },
      OS: {
        type: Sequelize.STRING
      },
      weight: {
        type: Sequelize.STRING
      },
      screenTechnology: {
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
    await queryInterface.dropTable('LaptopCategories');
  }
};
