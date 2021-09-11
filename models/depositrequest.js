'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class depositRequest extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  depositRequest.init({
    user_id: DataTypes.BIGINT,
    amount: DataTypes.BIGINT,
    screenshot: DataTypes.TEXT,
    comment: DataTypes.TEXT,
    status: DataTypes.ENUM('pending','hold','rejected','completed','failed')
  }, {
    sequelize,
    modelName: 'depositRequests',
  });
  return depositRequest;
};