'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('walletHistories', {
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
      amount: {
        type: Sequelize.BIGINT
      },
      balance: {
        type: Sequelize.BIGINT
      },
      credit_debit: {
        type: Sequelize.DataTypes.ENUM('credit','debit')
      },
      type: {
        type: Sequelize.ENUM('game','bonus','deposit')
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
    await queryInterface.dropTable('walletHistories');
  }
};