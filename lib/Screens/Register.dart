import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:vigenesia/Screens/Login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();

  TextEditingController profesiController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Register'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Register Your Acount",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 50),
                    FormBuilderTextField(
                      name: "Name",
                      controller: nameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder(),
                          labelText: "Nama"),
                    ),
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      name: "Profesi",
                      controller: profesiController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder(),
                          labelText: "Profesi"),
                    ),
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      name: "Email",
                      controller: emailController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder(),
                          labelText: "Email"),
                    ),
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      name: "Password",
                      controller: passwordController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder(),
                          labelText: "Password"),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Login())));
                          },
                          child: Text("Daftar")),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
