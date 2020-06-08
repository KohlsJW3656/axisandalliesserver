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

function rowToCountry(row) {
        return {
                c_id: row.c_id,
                c_name: row.c_name,
                ipcs: row.ipcs,
            
        };
}
function rowToPurchase(row){
        return{
                p_name: row.p_name,
                amount: row.amount,
                c_id: row.c_id,
                cost: row.cost,
                season_year: row.season_year,
                turn: row.turn,
        };
}

function rowToIncome(row) {
        return {
                c_id: row.c_id,
                revenue: row.revenue,
                lost: row.lost,
                season_year: row.season_year,
                turn: row.turn,
        };
}

//Get country
app.get('/country/:c_id', (request, response) => {
        const params = [request.params.c_id];
	const query = 'SELECT * FROM country WHERE c_id = ? ORDER BY c_id DESC';
	connection.query(query, params, (error, rows) => {
		response.send({
			ok: true,
			country: rows.map(rowToCountry),
		});
	});
});

//Change ipc amount
app.patch('/country/:c_id', (request, response) => {
        const query = 'UPDATE country SET c_name = ?, ipcs = ? WHERE c_id = ?';
        const params = [request.body.c_name, request.body.ipcs, request.params.c_id];
        connection.query(query, params, (error, result) => {
                response.send({
                        ok: true,
                });
        });
});

//Grab all purchases
app.get('/purchase', (request, response) => {
        const query = 'SELECT * FROM purchase ORDER BY turn ASC, c_id ASC, p_name ASC';
	connection.query(query, (error, rows) => {
		response.send({
			ok: true,
			purchase: rows.map(rowToPurchase),
		});
	});
});

//Insert into purchase
app.put('/purchase', (request, response) => {
        const query = 'INSERT INTO purchase(p_name, amount, c_id, cost, season_year, turn) VALUES (?,?,?,?,?,?)';
        const params = [request.body.p_name, request.body.amount, request.body.c_id, request.body.cost, request.body.season_year, request.body.turn];
        connection.query(query, params, (error, result) => {
                response.send({
                        ok: true,
                        c_id: result.insertId,
                });
        });
});

//Reset purchases
app.delete('/purchase', (request, response) => {
        const query = 'DELETE FROM purchase';
        connection.query(query, (error, result) => {
                response.send({
                        ok: true,
                });
        });
});

//Insert income
app.post('/income', (request, response) => {
        const query ='INSERT INTO income(c_id, revenue, lost, season_year, turn) VALUES (?,?,?,?,?)';
        const params = [request.body.c_id, request.body.revenue, request.body.lost, request.body.season_year, request.body.turn];
        connection.query(query, params, (error, result) => {
                response.send({
                        ok: true,
                        c_id: result.insertId,
                })
        })
})

//Grab income
app.get('/income', (request, response) => {
        const query = 'SELECT * FROM income ORDER BY turn ASC, c_id ASC';
	connection.query(query, (error, rows) => {
		response.send({
			ok: true,
			income: rows.map(rowToIncome),
		});
	});
});

//Reset income
app.delete('/income', (request, response) => {
        const query = 'DELETE FROM income';
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
