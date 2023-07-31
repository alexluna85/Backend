import { Compra } from "../Models/compras.js";
import { Usuario } from "../Models/usuarios.js";


const getCompras = async (req, res) => {
    try {
        const compras = await Compra.findAll({
            include: {
                model: Usuario,
                attributes: ['idUsuario', 'email', 'password', 'nombres', 'direccion', 'rol'],
            },
        });
        res.status(200).json(compras);
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: error });
    }
};

const getCompraById = async (req, res) => {
    const { idCompra } = req.params;
    try {
        const compra = await Compra.findAll({
            where: { idCompra },
            include: {
                model: Usuario,
                attributes: ['idUsuario', 'email', 'password', 'nombres', 'direccion', 'rol'],
            },
        });
        res.status(200).json(compra);
    } catch (error) {
        res.status(400).json({ mensaje: `Error al obtener la compra. ${error}` });
    }
};

const getComprasUsuario = async (req, res) => {
    const { idUsuario } = req.params;
    try {
        const compras = await Compra.findAll({
            where: { idUsuario }, 
            include: {
                model: Usuario,
                attributes: ['idUsuario', 'email', 'password', 'nombres', 'direccion', 'rol'],
            },
        });
        res.status(200).json(compras);
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: `Error al obtener la Compra. ${error}` });
    }
};

const postCompra = async (req, res) => {
    const { idUsuario, valorTotal } = req.body;
    try {
        const compra = await Compra.create({ idUsuario, valorTotal });
        res.status(201).json(compra);
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: error });
    }
};

const putCompra = async (req, res) => {
    const { idCompra } = req.params;
    const { idUsuario, valorTotal, fecha } = req.body; try {
        const oldCompra = await Compra.findByPk(idCompra);
        oldCompra.idUsuario = idUsuario;
        oldCompra.valorTotal = valorTotal;
        oldCompra.fecha = fecha;

        const modCompra = await oldCompra.save();
        res.status(200).json(modCompra);
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: error });
    }
};

const deleteCompra = async (req, res) => {
    const { idCompra } = req.params;
    try {
        const compra = await Compra.findByPk(idCompra);
        if (compra) {
            const respuesta = await compra.destroy();
            res.status(200).json({ message: `Compra con id ${idCompra} eliminado exitosamente. ${respuesta}` });
        } else {
            res.status(404).json({ message: 'Compra no encontrado.' });
        }
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: `No se pudo eliminar. ${error}` });
    }
};



export {
    getCompras,
    getCompraById,
    getComprasUsuario,
    postCompra,
    putCompra,
    deleteCompra,
}