'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class userDailyBonus extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  userDailyBonus.init({
    user_id: DataTypes.BIGINT,
    day: DataTypes.BIGINT,
    week: DataTypes.BIGINT,
    date: DataTypes.DATE,
    amount: DataTypes.BIGINT,
    status: DataTypes.ENUM('pending','claimed','expired'),
    comment: DataTypes.TEXT
  }, {
    sequelize,
    modelName: 'userDailyBonus',
  });
  return userDailyBonus;
};