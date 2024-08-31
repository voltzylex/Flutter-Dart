import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do_application/view/hive_page/controllers/hive_controller.dart';
import 'package:to_do_application/view/hive_page/models/hive_task_model.dart';

class HiveTaskPage extends StatefulWidget {
  const HiveTaskPage({super.key});

  @override
  State<HiveTaskPage> createState() => _HiveTaskPageState();
}

class _HiveTaskPageState extends State<HiveTaskPage> {
  final db = HiveController();
  final title = TextEditingController();
  final description = TextEditingController();
  final String _key = "hive_db";

  @override
  void initState() {
    super.initState();
  }

  void addTask(Task task) {
    db.addData(_key, task).then((value) {
      if (value) {
        setState(() {
          title.clear();
          description.clear();
        });
      }
    });
  }

  void editTask(int index, Task updatedTask) {
    db.getData(_key).then((tasks) {
      tasks[index] = updatedTask;
      db.box.put(_key, tasks.map((task) => task.toMap()).toList());
      setState(() {});
    });
  }

  void deleteTask(int index) {
    db.deleteData(_key, index).then((_) {
      setState(() {});
    });
  }

  void showEditDialog(BuildContext context, int index, Task task) {
    final editTitleController = TextEditingController(text: task.title);
    final editDescriptionController =
        TextEditingController(text: task.description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: editTitleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: editDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                final updatedTask = Task(
                  title: editTitleController.text,
                  description: editDescriptionController.text,
                  id: task.id,
                );
                editTask(index, updatedTask);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive Task Manager"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(
                labelText: 'Task Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: description,
              decoration: const InputDecoration(
                labelText: 'Task Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (title.text.isNotEmpty && description.text.isNotEmpty) {
                  addTask(
                    Task(
                      title: title.text,
                      description: description.text,
                      id: DateTime.now().microsecond,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Title and description cannot be empty"),
                  ));
                }
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              child: const Text("Add Task"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                future: db.getData(_key),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text("An error occurred"));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No tasks available"));
                  }

                  final tasks = snapshot.data as List<Task>;

                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          onLongPress: () {
                            db.getData(_key).then((tasks) {
                              final t = tasks.map((task) => task.toMap());
                              log("Mapped tasks : $t");
                            });
                          },
                          title: Text(task.title),
                          subtitle: Text(task.description),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  showEditDialog(context, index, task);
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  deleteTask(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
