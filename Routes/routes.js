import { Router } from 'express';
import {getProductos,getProductosNombre, getProductoById, getProductosTipo, postProducto, putProducto, deleteProducto} from '../Controllers/productosController.js';
import { getUsuarioById, getUsuarioEmail, postUsuario } from '../Controllers/usuariosController.js';
import {getCompraById, getComprasUsuario, postCompra} from '../Controllers/comprasController.js';
import {getProductosCompradosByCompraId, postProductoCompra} from '../Controllers/productosComprasController.js';
import { deleteCarrito, deleteProductoCarrito, getProductoCarritoById, getProductosCarritoUsuario, postProductoCarrito, putProductoCarrito } from '../Controllers/productosCarritoController.js';

const router = Router();

router.get("/", (req, res) => {
    res.send("GET Pagina Principal Express");
});

router.get("/productos", getProductos);
router.get("/productos/nombre/:nombre", getProductosNombre);
router.get("/productos/:idProducto", getProductoById);
router.get("/productos_tipo/:tipo", getProductosTipo);
router.post("/productos", postProducto);
router.put("/productos/:idProducto", putProducto);
router.delete("/productos/:idProducto", deleteProducto);

router.get("/usuario/:idUsuario", getUsuarioById);
router.get("/usuario_email/:email", getUsuarioEmail);
router.post("/usuario", postUsuario);

router.get("/productos_carrito/:idUsuario", getProductosCarritoUsuario);
router.get("/producto_carrito/:idProductoCarrito", getProductoCarritoById);
router.post("/producto_carrito", postProductoCarrito);
router.put("/producto_carrito/:idProductoCarrito", putProductoCarrito);
router.delete("/producto_carrito/:idProductoCarrito", deleteProductoCarrito);
router.delete("/carrito/:idUsuario", deleteCarrito);


router.get("/compra/:idCompra", getCompraById);
router.get("/compras_usuario/:idUsuario", getComprasUsuario);
router.post("/compra", postCompra);

router.get("/productos_comprados/:idCompra", getProductosCompradosByCompraId);
router.post("/producto_compra", postProductoCompra);

export default router;