import { DataTypes } from 'sequelize';
import {sequelize} from '../Database/database.js';
import {Usuario} from './usuarios.js';

const Compra = sequelize.define('Compra', {
  idCompra: {
    type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true, allowNull: false,
  },
  idUsuario: {
    type: DataTypes.INTEGER, allowNull: false, references: {
        model: Usuario,
        key: 'idUsuario'
      }
  },
  valorTotal: {
    type: DataTypes.DECIMAL(10, 2), allowNull: false,
  },
  fecha: {
    type: DataTypes.DATE, allowNull: false, defaultValue: () => new Date(),
  },
},
{
  timestamps: false,
});

Compra.belongsTo(Usuario, { foreignKey: 'idUsuario' });
Usuario.hasMany(Compra, { foreignKey: 'idUsuario' });

export {Compra};
