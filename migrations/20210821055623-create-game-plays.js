'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('gamePlays', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      game_id: {
        type: Sequelize.BIGINT
      },
      players: {
        type: Sequelize.BIGINT
      },
      comment: {
        type: Sequelize.TEXT
      },
      time: {
        type: Sequelize.BIGINT
      },
      time_left: {
        type: Sequelize.BIGINT
      },
      result_time: {
        type: Sequelize.BIGINT
      },
      result: {
        type: Sequelize.BIGINT
      },
      status: {
        type: Sequelize.ENUM('started','stopped','closed')
      },
      startTime: {
        type: Sequelize.DATE
      },
      endTime: {
        type: Sequelize.DATE
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
    await queryInterface.dropTable('gamePlays');
  }
};