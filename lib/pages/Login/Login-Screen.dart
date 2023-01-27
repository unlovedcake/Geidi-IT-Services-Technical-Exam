import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:student_info/Router/Navigate-Route.dart';
import 'package:student_info/Widgets/Loading-Indicator.dart';
import 'package:student_info/utilities/AssetStorageImage.dart';

import '../../Widgets/Toast-Message.dart';
import '../Student_list/Student-List-Screen.dart';
part 'Login-Extension-Controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Center(
                child: SizedBox(
                    width: size.width * .44,
                    height: size.height * .29,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset(AssetStorageImage.loginLogo)),
              ),
              textFieldEmailPassword(context, size),
            ],
          ),
        ),
      ),
    );
  }

  Column textFieldEmailPassword(BuildContext context, Size size) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          controller: userNameController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'User Name', hintText: 'Enter username'),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        TextFormField(
          textInputAction: TextInputAction.done,
          obscureText: _obscureText,
          controller: passwordController,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  color: _obscureText ? Colors.grey.shade400 : Colors.black,
                  icon: Icon(_obscureText ? Icons.remove_red_eye_outlined : Icons.remove_red_eye)),
              border: const OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter secure password'),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Forgot Password',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Container(
          height: size.height * .09,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: OutlinedButton(
            onPressed: () {
              startShowLoadingView();
              login();
              // Navigator.push(context, MaterialPageRoute(builder: (_) => StudentListScreen()));
            },
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        SizedBox(
          height: size.height * .14,
        ),
        InkWell(
          onTap: () {},
          child: RichText(
            text: const TextSpan(
              text: 'New User? ',
              style: TextStyle(fontSize: 18, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: 'Create Account',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
