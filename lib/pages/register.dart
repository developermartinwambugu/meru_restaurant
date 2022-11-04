import 'package:flutter/material.dart';
import 'package:merurestaurant/pages/login.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController tec_name = TextEditingController();
  TextEditingController tec_pass = TextEditingController();
  TextEditingController tec_email = TextEditingController();

  Future<dynamic> getLogin(String user, String password, String email) async {
    var url =
        Uri.parse("https://mato1mato.000webhostapp.com/baseone/register.php");
    try {
      var response = await http.post(url,
          body: {"user": user, "password": password, "email": email});

      var data = json.decode(response.body);
      if (data == "success") {
        AwesomeDialog(
          dismissOnTouchOutside: false,
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          title: 'SUCCESS',
          desc: 'Registration Complete',
          btnOkOnPress: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ));
          },
          btnOkIcon: Icons.check_circle,
          btnOkColor: Colors.green,
        ).show();
      } else if (data == "error") {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          title: 'Error',
          desc: 'User already exist.. Please try Again',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red,
        ).show();
      } else if (data == "dbconnerr") {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          title: 'DB Error',
          desc: 'Error Occured. Please try Again',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red,
        ).show();
      }
    } catch (IOClientExceptions) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        headerAnimationLoop: false,
        title: 'Host Error',
        desc: 'Host Error Occured. Please try Again',
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'MERU NATIONAL RESTAURANT',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 200,
              width: 300,
              child: Image.asset('assets/f1.jpg'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Enter Your Details To register',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 1,
                      ),
                      TextFormField(
                        controller: tec_name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Name Field";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            prefixIcon: const Icon(Icons.person),
                            hintText: 'Enter Your Name',
                            labelText: 'NAME',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: tec_email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Email Field";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            prefixIcon: const Icon(Icons.email),
                            hintText: 'Enter Your Email',
                            labelText: 'EMAIL',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: tec_pass,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Password Field";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'Enter Password',
                            labelText: 'PASSWORD',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ],
                  )),
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          getLogin(
                              tec_name.text, tec_pass.text, tec_email.text);
                        }
                      },
                      child: const Text('REGISTER')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ));
                        },
                        child: const Text('click here')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
