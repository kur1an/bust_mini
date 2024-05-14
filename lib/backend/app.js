// app.js

const express = require('express');
const mongoose = require('mongoose');

const app = express();
const port = 3000;

app.use(express.json());

mongoose.connect('mongodb://localhost:27017/hh', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));
db.once('open', () => {
  console.log('Connected to MongoDB');
  
});

const busTimingSchema = new mongoose.Schema({
  busNumber: String,
  source: String,
  destination: String,
  departureTime: String,
  arrivalTime: String,
});

const BusTiming = mongoose.model('BusTiming', busTimingSchema);

app.get('/', (req, res) => {
  res.send('Hello World!');
});

// Define your API endpoints here

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
