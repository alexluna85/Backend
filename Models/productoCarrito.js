import { DataTypes } from 'sequelize';
import {sequelize} from '../Database/database.js';
import {Producto} from './producto.js';
import { Usuario } from './usuarios.js';


const ProductoCarrito = sequelize.define('ProductoCarrito', {
  idProductoCarrito: {
    type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true, allowNull: false,
  },
  idUsuario: {
    type: DataTypes.INTEGER, allowNull: false, references: { model: Usuario, key: 'idusuario' }
  },
  idProducto: {
    type: DataTypes.INTEGER, allowNull: false, references: { model: Producto, key: 'idProducto' }
  },
  cantidad: {
    type: DataTypes.INTEGER, allowNull: false,
  },
  valorProductoCarrito: {
    type: DataTypes.DECIMAL(10, 2), allowNull: false,
  },
},
{
  timestamps: false,
});

ProductoCarrito.belongsTo(Producto, { foreignKey: 'idProducto' });
ProductoCarrito.belongsTo(Usuario, { foreignKey: 'idUsuario' });
Usuario.hasMany(ProductoCarrito, { foreignKey: 'idUsuario' });

export {ProductoCarrito};
