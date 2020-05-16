const express = require('express');
const cors = require('cors');
const mysql = require('mysql');
const fs = require('fs');

const app = express();
app.use(cors());
app.use(express.json());

let credentials = JSON.parse(fs.readFileSync('credentials.json', 'utf8'));
let connection = mysql.createConnection(credentials);
connection.connect();

function rowToObject(row) {

        return {
                c_id: row.c_id,
                c_name: row.c_name,
                ipcs: row.ipcs,
        };
        /*
	return {
		p_id: row.p_id,
		p_name: row.p_name,
		p_cost: row.p_cost,
        };
        */
}

app.get('/country/:c_id/:c_name/:ipcs', (request, response) => {
        const query = 'SELECT * FROM country WHERE c_id = ? ORDER BY c_id DESC';
        const params = [request.params.c_id];
	connection.query(query, params, (error, row) => {
		response.send({
			ok: true,
			country: row,
		});
	});
});

/*

app.get('/product/:p_id/:p_name', (request, response) => {
	const query = 'SELECT p_id, p_name, p_cost FROM product WHERE p_id = ? AND p_name = ? ORDER BY p_id DESC';
	const params = [request.params.p_id, request.params.p_name];
	connection.query(query, params, (error, rows) => {
		response.send({
			ok: true,
			product: rows.map(rowToObject),
		});
	});
});

app.post('/product', (request, response) => {
        const query = 'INSERT INTO product(p_id, p_name, p_cost) VALUES (?,?,?)';
        const params = [request.body.p_id, request.body.p_name, request.body.p_cost];
        connection.query(query, params, (error, result) => {
                response.send({
                        ok: true,
                        id: result.insertId,
                });
        });
});

app.patch('/product', (request, response) => {
        const query = 'UPDATE product SET p_id = ?, p_name = ?, p_cost = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?';
        const params = [request.body.p_id, request.body.p_name, request.body.p_cost, request.params.id];
        connection.query(query, params, (error, result) => {
                response.send({
                        ok: true,
                });
        });
});


app.delete('/product', (request, response) => {
        const query = 'UPDATE product SET is_deleted = 1, updated_at = CURRENT_TIMESTAMP WHERE id = ?';
        const params = [request.params.id];
        connection.query(query, params, (error, result) => {
                response.send({
                        ok: true,
                });
        });
});

*/

const port = 8300;
app.listen(port, () => {
	console.log(`We're live on port ${port}!`);
});
