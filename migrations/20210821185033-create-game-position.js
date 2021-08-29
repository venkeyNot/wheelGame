'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('gamePositions', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      user_id: {
        type: Sequelize.BIGINT
      },
      game_id: {
        type: Sequelize.BIGINT
      },
      game_play_id: {
        type: Sequelize.BIGINT
      },
      option: {
        type: Sequelize.BIGINT
      },
      ntimes: {
        type: Sequelize.BIGINT
      },
      amount: {
        type: Sequelize.BIGINT
      },
      comment: {
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
    await queryInterface.dropTable('gamePositions');
  }
};