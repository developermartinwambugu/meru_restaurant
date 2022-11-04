import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Help"),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 15,
              ),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        prefixIcon: const Icon(Icons.email),
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: 'Enter your Email',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Number";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        fillColor: Colors.white30,
                        filled: true,
                        prefixIcon: const Icon(Icons.phone),
                        hintText: 'Enter your Phone Number',
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter The Problem";
                      } else {
                        return null;
                      }
                    },
                    maxLines: 3,
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: 'Enter your Problem',
                        labelText: 'Problem',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )),
              Container(
                width: MediaQuery.of(context).size.width * 2 / 3,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "Message Successful sent. Please Wait for a reply")));
                      }
                    },
                    child: const Text('SUBMIT')),
              ),
            ],
          )),
    );
  }
}
