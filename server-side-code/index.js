const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');


// Cross-Origin Resource Sharing
const cors = require('cors')
const app = express()

app.use(express.json());
app.use(cors());

const port = process.env.PORT || 4500


const db = mysql.createConnection({

    host: 'localhost',
    user: 'root',
    password: '', 
    database: 'healthdiagnosis',
    
})


// this is connection code for database to backend
db.connect(error =>{
    if(error) {
        console.log('Database connection failed', err)

        return

    }
    console.log('Database connected')
})


app.listen(port , ()=>{
    console.log(`server is running in ${port}`)
})


// Reading departments datas
// async used to wait for database to fetch

app.get('/departments',async(req,res)=>{

    const query  = 'select * from department'

    db.query(query,(error,result)=>{

        if(!error){
            console.log(`fetched data ${result}`)

            res.send(result)
        }
        else{
            console.log('error getting appoint')
        }
    })
})

// Reading review datas

app.get('/reviews',async(req,res)=>{

    const query  = 'select * from review'

    db.query(query,(error,result)=>{
        if(!error){
            console.log(`fetched data ${result}`)

            res.send(result)
        }
        else{
            console.log('error getting appoint')
        }
    })
})


// Reading user datas


app.get('/newuser',async(req,res)=>{
    const query  = 'select * from newuser'

    db.query(query,(error,result)=>{
        if(!error){
            console.log(`fetched data ${result}`)

            res.send(result)
        }
        else{
            console.log('error getting appoint')
        }
    })
})

app.get('/appointment', (req, res) => {
    const query = 'SELECT * FROM newappointment';
  
    db.query(query, (err, results) => {
      if (err) {
        console.error('Error fetching data:', err);
        res.status(500).json({ error: 'Failed to retrieve appointments.' });
      } else {
        res.status(200).json(results);
      }
    });
  });




// Creating review
app.post('/review', (req, res) => {


    const { userid, rating, feedback } = req.body;

    const date = '2025-01-02';
    const inventory_id = 1; 
    const staff_id = 1;    

    const query = `
        INSERT INTO review (date, rating, inventory_id, user_id, staff_id, feedback) 
        VALUES (?, ?, ?, ?, ?, ?)
    `;


    db.query(query, [date, rating, inventory_id, userid, staff_id, feedback], (err, result) => {
        console.log(result)
        if (err) {
            console.error('Error inserting review:', err);
            res.status(500).send({ message: 'Failed to add review' });
        } else {
            res.status(201).send({ message: 'Review added successfully' });
        }
    });
});


app.post('/appointment', (req, res) => {
  const { name, email, phone_num, date_of_birth, appointed_doc, department, slotno } = req.body;

  const query = `
    INSERT INTO newappointment (name, email, phone_num, date_of_birth, appointed_doc, department, slotno)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `;

  const values = [name, email, phone_num, date_of_birth, appointed_doc, department, slotno];

  db.query(query, values, (err, result) => {
    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).json({ error: 'Failed to add appointment.' });
    } else {
      res.status(201).json({ message: 'Appointment added successfully.', appointmentId: result.insertId });
    }
  });
});




// Updating the department phone num
app.patch('/departments/:email', (req, res) => {

    const { email } = req.params; 
    const { phone } = req.body;  
  
  
    const query = `UPDATE department SET phone = ? WHERE email = ?`;
  
    db.query(query, [phone, email], (err, result) => {

      if (err) {
        console.error('Error updating phone number:', err);
        return res.status(500).json({ message: 'Failed to update phone number.' });
      }
  
      if (result.affectedRows === 0) {
        return res.status(404).json({ message: 'No record found with the given email.' });
      }
  
      res.status(200).json({ message: 'Phone number updated successfully.' });
    });
  });



// Deleting users
  app.delete('/newuser/:email', (req, res) => {

    const email = req.params.email;

    const deleteQuery = 'DELETE FROM newuser WHERE email = ?';

    db.query(deleteQuery, [email], (err, result) => {
        if (err) {
            console.error('Error deleting user:', err);
            return res.status(500).json({ error: 'Error deleting user' });
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'User not found' });
        }

        res.status(200).json({ message: 'User deleted successfully' });
    });
});


app.delete('/appointment/:email', (req, res) => {
  const { email } = req.params;

  const query = 'DELETE FROM newappointment WHERE email = ?';

  db.query(query, [email], (err, result) => {
    if (err) {
      console.error('Error deleting data:', err);
      res.status(500).json({ error: 'Failed to delete appointment.' });
    } else if (result.affectedRows === 0) {
      res.status(404).json({ message: 'Appointment not found.' });
    } else {
      res.status(200).json({ message: 'Appointment deleted successfully.' });
    }
  });
});