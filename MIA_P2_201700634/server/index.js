const express = require('express');
const cors = require('cors');
const PORT = process.env.PORT || 5000;

const app = express();

//Middlewares
app.use(cors());
app.use(express.json());


//Routes
app.use('/api/usuario',require('./routes/usuario.route'));

app.listen(PORT,() => {
    
    console.log('Server running on port', PORT);
})
