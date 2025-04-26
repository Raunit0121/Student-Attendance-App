import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'add_student_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void updateAttendance(String id, String status) {
    FirebaseFirestore.instance.collection('students').doc(id).update({
      'attendance': status,
    });
  }

  void deleteStudent(String id) {
    FirebaseFirestore.instance.collection('students').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            text: 'Student ',
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: 'Attendance',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('students').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var students = snapshot.data!.docs;

          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              var student = students[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Student Name: ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: student['name'],
                                style: const TextStyle(color: Colors.blue)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text.rich(
                        TextSpan(
                          text: 'Roll No: ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: student['rollNo'],
                                style: const TextStyle(color: Colors.blue)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text.rich(
                        TextSpan(
                          text: 'Age: ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: student['age'].toString(),
                                style: const TextStyle(color: Colors.blue)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Text(
                            'Attendance: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: student['attendance'] == 'P' ? Colors.green : Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              student['attendance'],
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              updateAttendance(student.id, 'P');
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            child: const Text('P'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              updateAttendance(student.id, 'A');
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                            child: const Text('A'),
                          ),
                          const SizedBox(width: 5),
                          IconButton(
                            onPressed: () {
                              deleteStudent(student.id);
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddStudentScreen()),
          );
        },
      ),
    );
  }
}
