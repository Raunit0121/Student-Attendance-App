import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _nameController = TextEditingController();
  final _rollNoController = TextEditingController();
  final _ageController = TextEditingController();

  void addStudent() {
    FirebaseFirestore.instance.collection('students').add({
      'name': _nameController.text,
      'rollNo': _rollNoController.text,
      'age': int.parse(_ageController.text),
      'attendance': 'P',
    }).then((_) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _rollNoController,
              decoration: const InputDecoration(labelText: 'Roll No'),
            ),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: addStudent,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 12)),
              child: const Text('Add Student'),
            )
          ],
        ),
      ),
    );
  }
}
