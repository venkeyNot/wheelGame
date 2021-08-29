'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('users', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      name: {
        type: Sequelize.STRING
      },
      email: {
        type: Sequelize.STRING
      },
      mobile: {
        type: Sequelize.STRING
      },
      wallet: {
        type: Sequelize.DOUBLE
      },

      earnings: {
        type: Sequelize.DOUBLE
      },
      password: {
        type: Sequelize.STRING
      },
      otp: {
        type: Sequelize.INTEGER
      },
      token: {
        type: Sequelize.TEXT
      },
      mobile_verified:{

        type: Sequelize.ENUM('yes','no')
      },

      bankAccountNumber: {
        type: Sequelize.TEXT
      },
      bankAccountName: {
        type: Sequelize.TEXT
      },
      bankIFSC: {
        type: Sequelize.TEXT
      },
      bankName: {
        type: Sequelize.TEXT
      },
      bankAddress: {
        type: Sequelize.TEXT
      },
      UPI: {
        type: Sequelize.TEXT
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
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('users');
  }
};