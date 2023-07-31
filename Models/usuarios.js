import { DataTypes } from 'sequelize';
import {sequelize} from '../Database/database.js';

const Usuario = sequelize.define('Usuario', {
  idUsuario: {
    type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true, allowNull: false,
  },
  email: {
    type: DataTypes.STRING, allowNull: false,
  },
  password: {
    type: DataTypes.STRING, allowNull: false,
  },
  nombres: {
    type: DataTypes.STRING,
  },
  direccion: {
    type: DataTypes.STRING,
  },
  rol: {
    type: DataTypes.STRING,
  },
},
{
  timestamps: false,
});

export  {Usuario};
