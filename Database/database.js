import Sequelize from "sequelize";

const sequelize = new Sequelize("alexfruver", "root", "", {
    host: "localhost",
    dialect: "mysql",
});

export {
    sequelize
};


