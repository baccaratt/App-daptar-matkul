import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Daftar Mata Kuliah'),
        ),
        body: CourseList(),
      ),
    );
  }
}

class Course {
  final String courseName;
  final String courseIcon; // Link to icon or image
  final int sks;

  Course(this.courseName, this.courseIcon, this.sks);
}

class CourseList extends StatelessWidget {
  final List<Course> courses = [
    Course('Matematika', 'link_to_math_icon', 3),
    Course('Fisika', 'link_to_physics_icon', 4),
    Course('Kimia', 'link_to_chemistry_icon', 3),
    Course('Bahasa Inggris', 'link_to_english_icon', 2),
    // Add more courses as needed
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return LazyGridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: constraints.maxWidth ~/ 200, // Adjust according to the screen width
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: <Widget>[
                Image.network(courses[index].courseIcon),
                SizedBox(height: 5),
                Text(
                  courses[index].courseName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('SKS: ${courses[index].sks}'),
              ],
            ),
          );
        },
        itemCount: courses.length,
      );
    });
  }
}
