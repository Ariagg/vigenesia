import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String baseurl = "https://8fe4-103-136-57-66.ngrok-free.app/vigenesia/";

  Future postRegister(
      String name, String profesi, String email, String password) async {
    var dio = Dio();

    dynamic data = {
      "nama": name,
      "profesi": profesi,
      "email": email,
      "password": password
    };

    try {
      final Response = await dio.post("$baseurl/api/registrasi/",
          data: data,
          options: Options(headers: {'cotent-type': 'application/json'}));

      print("Respon -> ${Response.data} + ${Response.statusCode}");

      if (Response.statusCode == 200) {
        return Response.data;
      }
    } catch (e) {
      print("Failed To Load $e");
    }
  }

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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 50),
                  FormBuilderTextField(
                    name: "name",
                    controller: nameController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(),
                        labelText: "Nama"),
                  ),
                  SizedBox(height: 20),
                  FormBuilderTextField(
                    name: "profesi",
                    controller: profesiController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(),
                        labelText: "Profesi"),
                  ),
                  SizedBox(height: 20),
                  FormBuilderTextField(
                    name: "email",
                    controller: emailController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(),
                        labelText: "Email"),
                  ),
                  SizedBox(height: 20),
                  FormBuilderTextField(
                    obscureText: true,
                    name: "password",
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
                        onPressed: () async {
                          await postRegister(
                                  nameController.text,
                                  profesiController.text,
                                  emailController.text,
                                  passwordController.text)
                              .then((value) => {
                                    if (value != null)
                                      {
                                        setState(() {
                                          Navigator.pop(context);
                                          Flushbar(
                                            message: "Berhasil Registrasi",
                                            duration: Duration(seconds: 2),
                                            backgroundColor: Colors.greenAccent,
                                            flushbarPosition:
                                                FlushbarPosition.TOP,
                                          ).show(context);
                                        })
                                      }
                                    else if (value == null)
                                      {
                                        Flushbar(
                                          message:
                                              "Check Your Field Before Register",
                                          duration: Duration(seconds: 5),
                                          backgroundColor: Colors.redAccent,
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                        ).show(context)
                                      }
                                  });
                        },
                        child: Text("Daftar")),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
