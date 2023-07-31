import { Producto } from "../Models/producto.js";
import { ProductoCompra } from "../Models/productoCompra.js";


const getProductosCompradosByCompraId = async (req, res) => {
    const { idCompra } = req.params;
    try {
        const productosComprados = await ProductoCompra.findAll({
            where: { idCompra },
            include: {
                model: Producto,
                // attributes: ['idUsuario', 'email', 'password', 'nombres', 'direccion', 'rol'],
            },
        });
        res.status(200).json(productosComprados);
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: error });
    }
};

const getProductoCompradosById = async (req, res) => {
    const { idProductoCompra } = req.params;
    try {
        const productoComprado = await ProductoCompra.findAll({
            where: { idProductoCompra },
            include: {
                model: Producto,
                // attributes: ['idUsuario', 'email', 'password', 'nombres', 'direccion', 'rol'],
            },
        });
        res.status(200).json(productoComprado);

    } catch (error) {
        res.status(400).json({ mensaje: `Error al obtener la compra. ${error}` });
    }
};

const postProductoCompra = async (req, res) => {
    const { idCompra, idProducto, cantidad, valorProductoCompra } = req.body;
    try {
        const productoCompra = await ProductoCompra.create({ idCompra, idProducto, cantidad, valorProductoCompra });
        res.status(201).json(productoCompra);

    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: error });
    }
};

const putProductoCompra = async (req, res) => {
    const { idProductoCompra } = req.params;
    const { cantidad, valorProductoCompra } = req.body;
    try {
        const oldProductoCompra = await ProductoCompra.findByPk(idProductoCompra);
        oldProductoCompra.cantidad = cantidad;
        oldProductoCompra.valorProductoCompra = valorProductoCompra;

        const modProductoCompra = await oldProductoCompra.save();
        res.status(200).json(modProductoCompra);
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: error });
    }
};

const deleteProductoCompra = async (req, res) => {
    const { idProductoCompra } = req.params;
    try {
        const productoCompra = await ProductoCompra.findByPk(idProductoCompra);
        if (productoCompra) {
            const respuesta = await productoCompra.destroy();
            res.status(200).json({ message: `Prod con id ${idProductoCompra} eliminado exitosamente. ${respuesta}` });
        } else {
            res.status(404).json({ message: 'Prod no encontrado.' });
        }
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: `No se pudo eliminar. ${error}` });
    }
};



export {
    getProductosCompradosByCompraId,
    getProductoCompradosById,
    postProductoCompra,
    putProductoCompra,
    deleteProductoCompra,
}