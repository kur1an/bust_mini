const express = require('express');
const { MongoClient } = require('mongodb');
const { OAuth2Client } = require('google-auth-library');

const app = express();
const PORT = 3000;
const MONGO_URL = 'mongodb://localhost:27017';
const DB_NAME = 'my_database';
const COLLECTION_NAME = 'login';
const CLIENT_ID = 'your_google_client_id';

app.use(express.json());

const client = new MongoClient(MONGO_URL);

async function connectToMongo() {
  try {
    await client.connect();
    console.log('Connected to MongoDB');
  } catch (error) {
    console.error('Error connecting to MongoDB', error);
    process.exit(1);
  }
}

connectToMongo();

app.post('/google-auth', async (req, res) => {
  const { token } = req.body;
  const client = new OAuth2Client(CLIENT_ID);

  try {
    const ticket = await client.verifyIdToken({
      idToken: token,
      audience: CLIENT_ID,
    });
    const payload = ticket.getPayload();
    const userId = payload['sub'];
    const email = payload['email'];

    const db = client.db(DB_NAME);
    const collection = db.collection(COLLECTION_NAME);

    const existingUser = await collection.findOne({ email });

    if (!existingUser) {
      await collection.insertOne({ email, userId });
    }

    res.status(200).send('Authentication successful');
  } catch (error) {
    console.error('Error verifying Google token', error);
    res.status(401).send('Authentication failed');
  }
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
