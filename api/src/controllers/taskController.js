const Task = require("../models/taskModel");

// Create Task
const createTask = async (req, res) => {
    try {
        const task = new Task(req.body);
        await task.save();
        res.status(201).json(task);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

// Get All Tasks
const getTasks = async (req, res) => {
    const tasks = await Task.find();
    res.json(tasks);
};

// Get Task by ID
const getTaskById = async (req, res) => {
    try {
        const task = await Task.findById(req.params.id);
        if (!task) {
            return res.status(404).json({ error: "Task not found" });
        }
        res.json(task);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

// Update Task
const updateTask = async (req, res) => {
    try {
        const task = await Task.findByIdAndUpdate(req.params.id, req.body, { new: true });
        res.json(task);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

// Delete Task
const deleteTask = async (req, res) => {
    await Task.findByIdAndDelete(req.params.id);
    res.json({ message: "Task deleted successfully" });
};


module.exports = { createTask, getTasks, getTaskById, updateTask, deleteTask }