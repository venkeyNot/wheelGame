'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Setting extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  Setting.init({
    name: DataTypes.TEXT,
    slug: DataTypes.TEXT,
    option: DataTypes.BIGINT,
    comment: DataTypes.TEXT,
    status: DataTypes.ENUM('show','hide')
  }, {
    sequelize,
    modelName: 'Setting',
  });
  return Setting;
};