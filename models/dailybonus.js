'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class dailyBonus extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  dailyBonus.init({
    name: DataTypes.STRING,
    description: DataTypes.TEXT,
    days: DataTypes.INTEGER,
    bonus: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'dailyBonus',
  });
  return dailyBonus;
};