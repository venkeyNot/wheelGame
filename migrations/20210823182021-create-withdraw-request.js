'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('withdrawRequests', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      user_id: {
        type: Sequelize.BIGINT
      },
      amount: {
        type: Sequelize.BIGINT
      },
      bankDetails: {
        type: Sequelize.TEXT
      },
      comment: {
        type: Sequelize.TEXT
      },
      status: {
        type: Sequelize.ENUM('pending','hold','rejected','completed','failed')
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
    await queryInterface.dropTable('withdrawRequests');
  }
};