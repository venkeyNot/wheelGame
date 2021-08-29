'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class color extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  color.init({
    name: DataTypes.TEXT,
    degrees: DataTypes.TEXT,
    slug: DataTypes.TEXT,
    count: DataTypes.BIGINT,
    comment: DataTypes.TEXT,
    status: DataTypes.ENUM('show','hide')
  }, {
    sequelize,
    modelName: 'color',
  });
  return color;
};