const dotenv = require('dotenv')
dotenv.config({ path: './.env' })
const { Sequelize } = require('sequelize');
const app = require('./app')
// const DB = process.env.DATABASE
const sequelize = new Sequelize('shopingwebdb', 'root', null, {
    host: 'localhost',
    dialect: 'mysql',
    logging: false
});
// Check connect
async function check() {
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
}
check()
const port = process.env.PORT || 3000

app.listen(port, () => {
    console.log(`App running on port ${port}`)
})
