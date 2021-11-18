'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class taskBonus extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  taskBonus.init({
    user_id: DataTypes.BIGINT,
    total_plays: DataTypes.BIGINT,
    bonus: DataTypes.BIGINT,
    status: DataTypes.ENUM('pending','expired','claim','claimed'),
    comment:DataTypes.STRING,
    claimed_date:DataTypes.DATE,
  }, {
    sequelize,
    modelName: 'taskBonus',
  });
  return taskBonus;
};