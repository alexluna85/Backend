import { DataTypes } from 'sequelize';
import { sequelize } from '../Database/database.js';

const Producto = sequelize.define('Producto', {
    idProducto: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false,
    },
    nombre: {
        type: DataTypes.STRING,
    },
    precio: {
        type: DataTypes.DECIMAL(10, 2),
    },
    detalle: {
        type: DataTypes.TEXT,
    },
    tipo: {
        type: DataTypes.TEXT,
    },
    imagen: {
        type: DataTypes.STRING,
    },
},
{
  timestamps: false,
});

export { Producto };
