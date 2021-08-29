'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class gamePosition extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  gamePosition.init({
    user_id: DataTypes.BIGINT,
    game_id: DataTypes.BIGINT,
    game_play_id: DataTypes.BIGINT,
    option: DataTypes.BIGINT,
    ntimes: DataTypes.BIGINT,
    amount: DataTypes.BIGINT,
    comment: DataTypes.TEXT
  }, {
    sequelize,
    modelName: 'gamePosition',
  });
  return gamePosition;
};