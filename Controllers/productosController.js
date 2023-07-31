import { Producto } from "../Models/producto.js";
import {Op} from 'sequelize';

const getProductos = async (req, res) => {
    try {
        const productos = await Producto.findAll();
        res.status(200).json(productos);
    } catch (error) {
        res.status(400).json({ mensaje: error });
    }
};

const getProductosNombre = async (req, res) => {
    const { nombre } = req.params;
    try {
        const productos = await Producto.findAll({
            where: {
                nombre: {
                    [Op.like]: `%${nombre}%`
                }
            }
        });
        res.status(200).json(productos);
    } catch (error) {
        res.status(400).json({ mensaje: error });
    }
};


const getProductoById = async (req, res) => {
    const { idProducto } = req.params;
    try {
        const producto = await Producto.findByPk(idProducto);
        res.status(200).json(producto);
    } catch (error) {
        res.status(400).json({ mensaje: `Error al obtener el producto. ${error}` });
    }
};

const getProductosTipo = async (req, res) => {
    const { tipo } = req.params;
    try {
        const productos = await Producto.findAll({ where: { tipo } });
        res.status(200).json(productos);
    } catch (error) {
        res.status(400).json({ mensaje: `Error al obtener el producto. ${error}` });
    }
};

const postProducto = async (req, res) => {
    const { nombre, precio, detalle, tipo, imagen } = req.body;
    try {
        const newProducto = await Producto.create({ nombre, precio, detalle, tipo, imagen });
        res.status(200).json(newProducto);
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: error });
    }
};

const putProducto = async (req, res) => {
    const { idProducto } = req.params;
    const { nombre, precio, detalle, tipo, imagen } = req.body;
    try {
        const oldProducto = await Producto.findByPk(idProducto);
        oldProducto.nombre = nombre;
        oldProducto.precio = precio;
        oldProducto.detalle = detalle;
        oldProducto.tipo = tipo;
        oldProducto.imagen = imagen;

        const modProducto = await oldProducto.save();
        res.status(200).json(modProducto);
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: error });
    }
};

const deleteProducto = async (req, res) => {
    const { idProducto } = req.params;
    try {
        const producto = await Producto.findByPk(idProducto);
        if (producto) {
            const respuesta = await producto.destroy();
            res.status(200).json(respuesta);
        } else {
            res.status(404).json({ message: 'Producto no encontrado.' });
        }
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: `No se pudo eliminar. ${error}` });
    }
};



export {getProductos,getProductosNombre, getProductoById, getProductosTipo, postProducto, putProducto, deleteProducto}