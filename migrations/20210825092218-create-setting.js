'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('bonusSettings', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      name: {
        type: Sequelize.TEXT
      },
      slug: {
        type: Sequelize.TEXT
      },
      option: {
        type: Sequelize.BIGINT
      },
      comment: {
        type: Sequelize.TEXT
      },
      status: {
        type: Sequelize.ENUM('show','hide')
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
    await queryInterface.dropTable('bonusSettings');
  }
};