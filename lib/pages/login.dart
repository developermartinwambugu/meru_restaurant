import 'package:flutter/material.dart';
import 'package:merurestaurant/pages/dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:merurestaurant/pages/register.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController tec_name = TextEditingController();
  TextEditingController tec_pass = TextEditingController();

  Future<dynamic> getLogin(String user, String password) async {
    var url =
        Uri.parse("https://mato1mato.000webhostapp.com/baseone/login.php");
    try {
      var response =
          await http.post(url, body: {"user": user, "password": password});

      var data = json.decode(response.body);
      if (data == "success") {
        Fluttertoast.showToast(
            msg: "Logged In Successful",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.cyan,
            fontSize: 16.0);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MyDashboard(user: user)));
      } else if (data == "error") {
        Fluttertoast.showToast(
            msg: "Sorry!\nWrong Phone Number/Password. Please try again.",
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.cyan,
            fontSize: 16.0);
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          title: 'DB Error',
          desc: 'Error Occured.. Please try Again',
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
        title: 'DB Error',
        desc: 'Error Occured.. Please try Again',
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
    }
  }

  onChanged(checked) {
    setState(() {
      checked = true;
    });
  }

  bool checked = false;

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
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'WELCOME BACK',
                  style: TextStyle(color: Colors.blue, fontSize: 19),
                ),
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Name Field";
                          } else {
                            return null;
                          }
                        },
                        controller: tec_name,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            prefixIcon: const Icon(Icons.person),
                            hintText: 'Enter Your Name',
                            labelText: 'NAME',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    // const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: tec_pass,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Password Field";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'Enter Your Password',
                            labelText: 'PASSWORD',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ],
                )),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          getLogin(tec_name.text, tec_pass.text);
                        }
                      },
                      child: const Text('LOGIN')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont have an account? "),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
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
