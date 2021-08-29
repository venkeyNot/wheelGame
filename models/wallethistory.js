'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class walletHistory extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  walletHistory.init({
    user_id: DataTypes.BIGINT,
    game_id: DataTypes.BIGINT,
    amount: DataTypes.BIGINT,
    balance: DataTypes.BIGINT,
    credit_debit: DataTypes.ENUM('credit','debit'),
    type: DataTypes.ENUM('game','bonus','deposit'),
    comment: DataTypes.TEXT
  }, {
    sequelize,
    modelName: 'walletHistory',
  });
  return walletHistory;
};