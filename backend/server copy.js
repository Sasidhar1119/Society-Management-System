var mysql = require('mysql2');
const express = require('express');
const cors = require('cors');
const app = express();
const port = 3000;

app.use(express.json())
app.use(express.urlencoded());
app.use(cors());

var con = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "Ashif@786@1234",
	database: "sms_final"
});

app.get('/profile/:id', (req, res) => {
	let id=req.params;
	Promise.all([
		new Promise((resolve, reject) => {
			con.query(
				`SELECT * 
          FROM RESIDENTS, residents_doj
          WHERE RESIDENTS.REGISTRATION_ID = ? 
          AND residents_doj.APARTMENT_ID = RESIDENTS.APARTMENT_ID`,
				[id],
				function (err, result, fields) {
					if (err) reject(err);
					else resolve(result);
				}
			);
		}),
		new Promise((resolve, reject) => {
			con.query(
				`SELECT NAME, START_DATE
          FROM EVENTS, resident_conducts
          WHERE resident_conducts.REGISTRATION_ID = ? 
          AND resident_conducts.EVENT_ID = EVENTS.EVENT_ID`,
				[id],
				function (err, result, fields) {
					if (err) reject(err);
					else resolve(result);
				}
			);
		})
	])
		.then(([result1, result2]) => {
			res.status(200).json({ residents: result1, events: result2 });
		})
		.catch(err => {
			console.error('Error:', err);
			res.status(500).send('An error occurred');
		});
});



app.listen(port, () => {
	console.log("connected succesfully");
})

con.connect(function (err) {
	if (err) throw err;
	console.log("Connected!");
});