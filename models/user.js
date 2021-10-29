'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  User.init({
    name: DataTypes.STRING,
    email: DataTypes.STRING,
    mobile: DataTypes.STRING,
    password: DataTypes.STRING,
    otp: DataTypes.STRING,
    token: DataTypes.TEXT,
    firebaseToken: DataTypes.TEXT,
    mobile_verified: DataTypes.ENUM('yes','no'),
    wallet: DataTypes.DOUBLE,
    earnings: DataTypes.DOUBLE,
    gulkan_points: DataTypes.DOUBLE,
    profilePic: DataTypes.STRING,
    bankAccountNumber: DataTypes.STRING,
    bankAccountName: DataTypes.STRING,
    bankIFSC: DataTypes.STRING,
    bankName: DataTypes.STRING,
    bankAddress: DataTypes.STRING,
    UPI: DataTypes.STRING,
    your_id: DataTypes.STRING,
    referral_id: DataTypes.STRING,
  }, {
    sequelize,
    modelName: 'user',
  });
  return User;
};