'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('TelevisionCategories', {
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
      imageTechnology: {
        type: Sequelize.STRING
      },
      screenResolution: {
        type: Sequelize.STRING
      },
      screenType: {
        type: Sequelize.STRING
      },
      refreshRate: {
        type: Sequelize.STRING
      },
      televisionType: {
        type: Sequelize.STRING
      },
      audioTechnology: {
        type: Sequelize.STRING
      },
      OS: {
        type: Sequelize.STRING
      },
      label: {
        type: Sequelize.STRING
      },
      feature: {
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
    await queryInterface.dropTable('TelevisionCategories');
  }
};
