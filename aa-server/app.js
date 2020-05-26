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
        
}
function rowToObject1(row){
        return{
                p_name: row.p_name,
                amount: row.amount,
                c_id: row.c_id,
                season_year: row.season_year,
                turn: row.turn,
        }
        
}

app.get('/country/:c_id', (request, response) => {
        const params = [request.params.c_id];
	const query = 'SELECT * FROM country WHERE c_id = ? ORDER BY c_id DESC';
	connection.query(query, params, (error, rows) => {
		response.send({
			ok: true,
			country: rows.map(rowToObject),
		});
	});
});

app.patch('/country/:c_id', (request, response) => {
        const query = 'UPDATE country SET ipcs = ? WHERE c_id = ?';
        const params = [request.body.ipcs, request.params.c_id];
        connection.query(query, params, (error, result) => {
                response.send({
                        ok: true,
                });
        });
});


app.get('/purchase/:c_id/:turn', (request, response) => {
	const query = 'SELECT * FROM purchase WHERE c_id = ? AND turn = ?';
	const params = [request.params.c_id, request.params.turn];
	connection.query(query, params, (error, rows) => {
		response.send({
			ok: true,
			purchase: rows.map(rowToObject),
		});
	});
});

app.get('/purchase', (request, response) => {
        const query = 'SELECT * FROM purchase ORDER BY c_id AND turn';
	connection.query(query, (error, rows) => {
		response.send({
			ok: true,
			purchase: rows.map(rowToObject1),
		});
	});
});

app.post('/purchase', (request, response) => {
        const query = 'INSERT INTO purchase(p_name, amount, c_id, season_year, turn) VALUES (?,?,?,?,?)';
        const params = [request.body.p_name, request.body.amount, request.body.c_id, request.body.season_year, request.body.turn];
        connection.query(query, params, (error, result) => {
                response.send({
                        ok: true,
                        p_id: result.insertId,
                        c_id: result.insertId,
                });
        });
});

app.delete('/purchase', (request, response) => {
        const query = 'DELETE FROM purchase';
        connection.query(query, (error, result) => {
                response.send({
                        ok: true,
                });
        });
});


const port = 3443;
app.listen(port, () => {
	console.log(`We're live on port ${port}!`);
});
