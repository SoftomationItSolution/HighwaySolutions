const sql = require('mssql');
const path = require('path');
const {
  root_path,db_path
} = require("./constants");
const dbDirectory = path.join(root_path, db_path);
const databaseConfig = require(dbDirectory);


class Database {
    constructor() {
        this.pool = null;
    }

    async getPool() {
        if (!this.pool) {
            try {
                this.pool = await sql.connect(databaseConfig);
                console.log('Connected to SQL Server');
            } catch (err) {
                console.error('Database connection failed: ', err);
                throw err;
            }
        }
        return this.pool;
    }
}

module.exports = new Database();