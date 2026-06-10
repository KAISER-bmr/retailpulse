require('dotenv').config();
const express     = require('express');
const cors        = require('cors');
const salesRoutes = require('./routes/salesRoutes');

const app  = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.use('/api/sales', salesRoutes);

app.get('/', (req, res) => {
    res.json({ message: 'RetailPulse API is running!' });
});

app.listen(PORT, () => {
    console.log(`RetailPulse API running on http://localhost:${PORT}`);
});