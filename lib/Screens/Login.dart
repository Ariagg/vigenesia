import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:vigenesia/Screens/MainScreen.dart';
import 'package:vigenesia/Screens/Register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.home),
        title: Text('Visi Generasi Indonesia'),
      ),
      body: SingleChildScrollView(
          child: Container(
              color: Colors.redAccent,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login Area-Security System',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    // ============ TEXT BOX EMAIL ================
                    SizedBox(height: 20),
                    Center(
                      child: Form(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: Column(
                            children: [
                              FormBuilderTextField(
                                name: "email",
                                controller: emailController,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    border: OutlineInputBorder(),
                                    labelText: "Email"),
                              ),
                              // ============ TEXT BOX PASWORD ================
                              SizedBox(
                                height: 20,
                              ),
                              FormBuilderTextField(
                                obscureText: true,
                                name: "Password",
                                controller: passwordController,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    border: OutlineInputBorder(),
                                    labelText: "Password"),
                              ),
                              // ============ TEXT No Account ================
                              SizedBox(
                                height: 30,
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Dont have account ?',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    TextSpan(
                                      text: ' Sign Up',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          new Register()));
                                        },
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 40),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                new MainScreen()));
                                  },
                                  child: Text("Sign In"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //awal script textfield email
                  ],
                ),
              ))),
    );
  }
}
