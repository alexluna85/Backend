import { DataTypes } from 'sequelize';
import {sequelize} from '../Database/database.js';
import {Compra} from './compras.js';
import {Producto} from './producto.js';


const ProductoCompra = sequelize.define('ProductoCompra', {
  idProductoCompra: {
    type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true, allowNull: false,
  },
  idCompra: {
    type: DataTypes.INTEGER, allowNull: false, references: { model: Compra, key: 'idCompra' }
  },
  idProducto: {
    type: DataTypes.INTEGER, allowNull: false, references: { model: Producto, key: 'idProducto' }
  },
  cantidad: {
    type: DataTypes.INTEGER, allowNull: false,
  },
  valorProductoCompra: {
    type: DataTypes.DECIMAL(10, 2), allowNull: false,
  },
},
{
  timestamps: false,
});

ProductoCompra.belongsTo(Producto, { foreignKey: 'idProducto' });
ProductoCompra.belongsTo(Compra, { foreignKey: 'idCompra' });
Compra.hasMany(ProductoCompra, { foreignKey: 'idCompra' });

export {ProductoCompra};
