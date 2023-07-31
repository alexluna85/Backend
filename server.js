import express from "express";
import router from "./Routes/routes.js";
import { sequelize } from "./Database/database.js";
import cors from 'cors';
import { ProductoCarrito } from "./Models/productoCarrito.js";

const app = express();
app.use(cors());
app.use(express.json());
app.use(router);
app.set('port', 3000);

const testDb = async () => {
    try {
        await sequelize.authenticate();
        await sequelize.sync();
        console.log('La conexion fue exitosa');
        app.listen(app.get('port'), () => {
            console.log(`Backend en http://localhost:${app.get('port')}`);
        });
    } catch (error) {
        console.error(`La conexion presento un error. ${error}`);
    }
};
testDb();
