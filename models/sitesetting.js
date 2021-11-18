'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class siteSetting extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  siteSetting.init({
    logo: DataTypes.TEXT,
    site_logo: DataTypes.TEXT,
    site_name: DataTypes.TEXT,
    android_url: DataTypes.TEXT,
    help_line_no: DataTypes.TEXT,
    phone: DataTypes.TEXT,
    payment_barcode: DataTypes.TEXT,
    upi: DataTypes.TEXT,
    min_android_version:DataTypes.TEXT,
    admin_profit:DataTypes.DOUBLE,
    gameServerStatus: DataTypes.ENUM('start','stop'),
    status: DataTypes.ENUM('live','stop'),
    status_text:DataTypes.TEXT
  }, {
    sequelize,
    modelName: 'site_settings',
  });
  return siteSetting;
};