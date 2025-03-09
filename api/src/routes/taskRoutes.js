const express = require("express");
const router = express.Router();
const { createTask, getTasks, getTaskById, updateTask, deleteTask } = require("../controllers/taskController");

router.post("/createtask", createTask);
router.get("/getalltasks", getTasks);
router.get("/task/:id", getTaskById);
router.put("/updatetask/:id", updateTask);
router.delete("/deletetask/:id", deleteTask);

module.exports = router;