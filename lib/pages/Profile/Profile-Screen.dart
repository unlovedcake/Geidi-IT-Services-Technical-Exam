import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_info/global-variable/Global-Variable.dart';

import '../../utilities/Curve-Clipper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var style1 = const TextStyle(fontWeight: FontWeight.w500, fontSize: 28, color: Colors.black);
    var style2 = TextStyle(color: Colors.grey.shade500, fontSize: 22);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: style1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CurveClipper(),
              child: Container(
                padding: const EdgeInsets.all(12),
                width: size.width,
                height: size.height * .75,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: const [
                  BoxShadow(
                    offset: Offset(-5, -5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    color: Colors.white,
                  ),
                ]),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          studentModel?.photo ?? "",
                          width: size.width * .38,
                          height: size.height * .25,
                        ),
                      ),
                    ),
                    Text(
                      studentModel?.name ?? "",
                      style: style1,
                    ),
                    Text(
                      "Age : ${studentModel?.age ?? ""}",
                      style: style2,
                    ),
                    SizedBox(
                      height: size.height * .04,
                    ),
                    Text(
                      studentModel?.course ?? "",
                      style: style1,
                    ),
                    Text(
                      "Year Level : ${studentModel?.yearLevel ?? ""}",
                      style: style2,
                    ),
                    SizedBox(
                      height: size.height * .04,
                    ),
                    Text(
                      "Subjects",
                      style: style1,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      child: Column(
                        children: List.generate(
                          studentModel?.subjects!.length ?? 1,
                          (index) => Text(
                            studentModel?.subjects![index] ?? "",
                            style: style2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
