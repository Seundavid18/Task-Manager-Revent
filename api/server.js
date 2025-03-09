const express = require("express");
const connectDB = require("./config/db");
const taskRoutes = require("./src/routes/taskRoutes");
const dotenv = require('dotenv')
dotenv.config()
const cors = require('cors')

const app = express();
app.use(express.json());

connectDB();

app.use(cors());
app.use("/api", taskRoutes);

const PORT = process.env.PORT || 6000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
})
