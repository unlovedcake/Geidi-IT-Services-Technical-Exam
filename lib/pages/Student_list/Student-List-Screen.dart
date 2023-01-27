import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_info/global-variable/Global-Variable.dart';
import 'package:student_info/pages/Profile/Profile-Screen.dart';

import '../../Router/Navigate-Route.dart';
import '../../models/Stundent-Model.dart';
import '../../models/Stundent-Model.dart';
import '../../models/Stundent-Model.dart';
import '../../utilities/RichText-HightTermText.dart';
part 'Student-Extension-Controller.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => StudentListScreenState();
}

class StudentListScreenState extends State<StudentListScreen> {
  TextEditingController searchController = TextEditingController();

  String highLightSearchtTerm = "";

  List<StudentModel>? displayAllStudents = [];

  @override
  void initState() {
    getAllStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var style1 = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text('Student List', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: size.height * .02),
            searchTextField(),
            SizedBox(height: size.height * .02),
            listViewDataStudents(style1, size),
          ],
        ),
      ),
    );
  }

  Expanded listViewDataStudents(TextStyle style1, Size size) {
    displayAllStudents?.sort((a, b) => a.name.toString().compareTo(b.name.toString()));

    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: displayAllStudents?.length ?? 0,
        itemBuilder: (context, index) {
          String suggestion = displayAllStudents?[index].name.toString().toUpperCase() ?? "";
          int startIndex = suggestion.indexOf(highLightSearchtTerm);
          return InkWell(
            onTap: () {
              //sav selected student to global variable
              studentModel = displayAllStudents?[index];
              Navigator.of(context).push(pageRouteAnimate(const ProfileScreen()));
              FocusScope.of(context).unfocus();
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    profilePhoto(index),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: startIndex != -1
                                ? searchHiglightTermText(suggestion, highLightSearchtTerm)
                                : const SizedBox.shrink(),
                          ),
                          // Text(
                          //   students[index].name ?? "",
                          //   style: style1,
                          // ),
                          Text("Age : ${displayAllStudents?[index].age}"),
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
                                  displayAllStudents?[index].course ?? "",
                                  style: style1,
                                ),
                                Text("Year Level : ${displayAllStudents?[index].yearLevel}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_outlined),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  TextField searchTextField() {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      controller: searchController,
      decoration: InputDecoration(
        focusedBorder:
            const OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black)),
        suffixIcon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        hintText: 'Search...',
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: (value) {
        setState(() {
          highLightSearchtTerm = value.toUpperCase();
          _searchFilter(value);
        });
      },
    );
  }

  ClipRRect profilePhoto(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Hero(
        tag: displayAllStudents?[index].id ?? 0,
        child: Image.network(
          displayAllStudents?[index].photo ?? '',
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Padding textFieldNameAgeCourseYear(int index, TextStyle style1, Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            displayAllStudents?[index].name ?? "",
            style: style1,
          ),
          Text("Age : ${displayAllStudents?[index].age}"),
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
                  displayAllStudents?[index].course ?? "",
                  style: style1,
                ),
                Text("Year Level : ${displayAllStudents?[index].yearLevel}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
