'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class withdrawRequest extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  withdrawRequest.init({
    user_id: DataTypes.BIGINT,
    amount: DataTypes.BIGINT,
    bankDetails: DataTypes.TEXT,
    comment: DataTypes.TEXT,
    status: DataTypes.ENUM('pending','hold','rejected','completed','failed')
  }, {
    sequelize,
    modelName: 'withdrawRequest',
  });
  return withdrawRequest;
};