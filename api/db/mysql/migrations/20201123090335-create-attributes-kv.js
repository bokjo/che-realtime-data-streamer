'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('attributes_kvs', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      attribute_id: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      attribute: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      create_ts: {
        allowNull: false,
        type: Sequelize.DATE
      },
      update_ts: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('attributes_kvs');
  }
};