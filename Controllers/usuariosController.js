import { Usuario } from "../Models/usuarios.js";


const getUsuarios = async (req, res) => {
    try {
        const usuarios = await Usuario.findAll();
        res.status(200).json(usuarios);
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: error });
    }
};

const getUsuarioById = async (req, res) => {
    const { idUsuario } = req.params;
    try {
        const usuario = await Usuario.findByPk(idUsuario);
        res.status(200).json(usuario);
    } catch (error) {
        res.status(400).json({ mensaje: `Error al obtener el Usuario. ${error}` });
    }
};

const getUsuarioEmail = async (req, res) => {
    const { email } = req.params;
    try {
        const usuario = await Usuario.findOne({ where: { email } });
        res.status(200).json(usuario);
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: `Error al obtener el Usuario. ${error}` });
    }
};

const postUsuario = async (req, res) => {
    const { email, password, nombres, direccion, rol } = req.body;
    try {
        const newUsuario = await Usuario.create({ email, password, nombres, direccion, rol });
        res.status(200).json(newUsuario);
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: error });
    }
};

const putUsuario = async (req, res) => {
    const { idUsuario } = req.params;
    const { email, password, nombres, direccion, rol } = req.body;
    try {
        const oldUsuario = await Usuario.findByPk(idUsuario);
        oldUsuario.email = email;
        oldUsuario.password = password;
        oldUsuario.nombres = nombres;
        oldUsuario.direccion = direccion;
        oldUsuario.rol = rol;

        const modUsuario = await oldUsuario.save();
        res.status(200).json(modUsuario);
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: error });
    }
};

const deleteUsuario = async (req, res) => {
    const { idUsuario } = req.params;
    try {
        const usuario = await Usuario.findByPk(idUsuario);
        if (usuario) {
            const respuesta = await usuario.destroy();
            res.status(200).json({ message: `Usuario con id ${idUsuario} eliminado exitosamente. ${respuesta}` });
        } else {
            res.status(404).json({ message: 'Usuario no encontrado.' });
        }
    } catch (error) {
        console.error(error);
        res.status(400).json({ mensaje: `No se pudo eliminar. ${error}` });
    }
};



export {
    getUsuarios,
    getUsuarioById,
    getUsuarioEmail,
    postUsuario,
    putUsuario,
    deleteUsuario,
}