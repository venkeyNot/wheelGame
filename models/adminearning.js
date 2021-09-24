'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class adminEarning extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  adminEarning.init({
    date: DataTypes.DATE,
    day: DataTypes.BIGINT,
    amount: DataTypes.BIGINT,
    comment: DataTypes.TEXT
  }, {
    sequelize,
    modelName: 'adminEarning',
  });
  return adminEarning;
};