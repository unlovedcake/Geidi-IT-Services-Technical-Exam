import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_info/global-variable/Global-Variable.dart';
import 'package:student_info/pages/Profile/Profile-Screen.dart';

import '../../Router/Navigate-Route.dart';
import '../../models/Stundent-Model.dart';
import '../../models/Stundent-Model.dart';
import '../../models/Stundent-Model.dart';
part 'Student-Extension-Controller.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => StudentListScreenState();
}

class StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var style1 = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text('Student List', style: TextStyle(color: Colors.black)),
      ),
      body: FutureBuilder<List<StudentModel>>(
        future: fetchStudentData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: students.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  //sav selected student to global variable
                  studentModel = students[index];
                  Navigator.of(context).push(pageRouteAnimate(const ProfileScreen()));
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: <Widget>[
                        profilePhoto(index),
                        textFieldNameAgeCourseYear(index, style1, size),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  ClipRRect profilePhoto(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        students[index].photo ?? '',
        width: 80,
        height: 80,
      ),
    );
  }

  Padding textFieldNameAgeCourseYear(int index, TextStyle style1, Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            students[index].name ?? "",
            style: style1,
          ),
          Text("Age : ${students[index].age}"),
          SizedBox(
            width: size.width * .38,
            child: Divider(
              color: Colors.grey.shade300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  students[index].course ?? "",
                  style: style1,
                ),
                Text("Year Level : ${students[index].yearLevel}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
