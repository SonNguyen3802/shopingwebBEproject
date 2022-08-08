'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Users', {
      id: {
        allowNull: false,
        primaryKey: true,
        type: Sequelize.STRING
      },
      username: {
        type: Sequelize.STRING,
        charset: ' utf8',
        collate: 'utf8_general_ci'
      },
      password: {
        type: Sequelize.STRING,
        validate: {
          min: 8,
          max: 16
        }
      },
      email: {
        type: Sequelize.STRING,
        validate: {
          isEmail: true
        }
      },
      phone: {
        type: Sequelize.STRING,
        validate: {
          min: 10,
          max: 10
        }
      },
      address: {
        type: Sequelize.STRING,
        charset: 'utf8',
        collate: 'utf8_general_ci',
      },
      roleId: {
        type: Sequelize.INTEGER,
        defaultValue: 1,
        references: {
          model: 'Roles',
          key: 'id'
        }
      },
      tokenChangePass: {
        type: Sequelize.STRING
      },
      typeLogin: {
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
    await queryInterface.dropTable('Users');
  }
};
