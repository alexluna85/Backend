import { Producto } from "../Models/producto.js";
import { ProductoCarrito } from "../Models/productoCarrito.js";


const getProductosCarritoUsuario = async (req, res) => {
    const { idUsuario } = req.params;
    try {
        const productosCarrito = await ProductoCarrito.findAll({
            where: { idUsuario },
            include: {
                model: Producto, // attributes: ['idUsuario', 'email', 'password', 'nombres', 'direccion', 'rol'],
            },
        });
        res.status(200).json(productosCarrito);
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: error });
    }
};

const getProductoCarritoById = async (req, res) => {
    const { idProductoCarrito } = req.params;
    try {
        const productoCarrito = await ProductoCarrito.findAll({
            where: { idProductoCarrito },
            include: {
                model: Producto,
                // attributes: ['idUsuario', 'email', 'password', 'nombres', 'direccion', 'rol'],
            },
        });
        res.status(200).json(productoCarrito);

    } catch (error) {
        res.status(400).json({ mensaje: `Error al obtener la compra. ${error}` });
    }
};

const postProductoCarrito = async (req, res) => {
    const { idUsuario, idProducto, cantidad, valorProductoCarrito } = req.body;
    try {
        const producto = await ProductoCarrito.findOne({ where: { idProducto } });
        if (producto) {
            producto.cantidad += cantidad;
            let valorAntes=parseFloat(producto.valorProductoCarrito);
            let valorAhora=valorAntes+valorProductoCarrito;
            producto.valorProductoCarrito=valorAhora;
            await producto.save();
            res.status(200).json(producto);
        }else{
            const productoCarrito = await ProductoCarrito.create({ idUsuario, idProducto, cantidad, valorProductoCarrito });
            res.status(201).json(productoCarrito);
        }
        
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: error });
    }
};

const putProductoCarrito = async (req, res) => {
    const { idProductoCarrito } = req.params;
    const { cantidad, valorProductoCarrito } = req.body;
    try {
        const oldProductoCarrito = await ProductoCarrito.findByPk(idProductoCarrito);
        oldProductoCarrito.cantidad = cantidad;
        oldProductoCarrito.valorProductoCarrito = valorProductoCarrito;

        const modProductoCarrito = await oldProductoCarrito.save();
        res.status(200).json(modProductoCarrito);
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: error });
    }
};

const deleteProductoCarrito = async (req, res) => {
    const { idProductoCarrito } = req.params;
    try {
        const productoCarrito = await ProductoCarrito.findByPk(idProductoCarrito);
        if (productoCarrito) {
            const respuesta = await productoCarrito.destroy();
            res.status(200).json(respuesta);
        } else {
            res.status(404).json({ message: 'Prod no encontrado.' });
        }
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: `No se pudo eliminar. ${error}` });
    }
};

const deleteCarrito = async (req, res) => {
    const { idUsuario } = req.params;
    try {
        await ProductoCarrito.destroy({
            where: { idUsuario },
        });
        res.status(200).json({ mensaje: 'Productos del carrito eliminados con éxito.' });
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: `No se pudo eliminar. ${error}` });
    }
};


export {
    getProductosCarritoUsuario,
    getProductoCarritoById,
    postProductoCarrito,
    putProductoCarrito,
    deleteProductoCarrito,
    deleteCarrito
}