'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class gamePlays extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  gamePlays.init({
    game_id: DataTypes.BIGINT,
    players: DataTypes.BIGINT,
    comment: DataTypes.TEXT,
    result_time: DataTypes.BIGINT,
    result: DataTypes.BIGINT,
    time: DataTypes.BIGINT,
    time_left: DataTypes.BIGINT,
    admin_profit: DataTypes.BIGINT,
    status:DataTypes.ENUM('started','result','stopped','closed'),
    refund_status:DataTypes.ENUM('pending','success'),
    startTime: DataTypes.DATE,
    endTime: DataTypes.DATE
  }, {
    sequelize,
    modelName: 'gamePlays',
  });
  return gamePlays;
};