'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class attributes_kv extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  attributes_kv.init({
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false
    },
    attribute_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    attribute: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    create_ts: {
      type: DataTypes.DATE,
      allowNull: false
    },
    update_ts: {
      type: DataTypes.DATE,
      allowNull: false
    }
  }, {
    sequelize,
    modelName: 'attributes_kv',
  });
  return attributes_kv;
};