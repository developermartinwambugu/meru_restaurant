import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'CHANGE DELIVERY',
                style: TextStyle(fontSize: 20, color: Colors.amber),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Delivery Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Enter New Delivery Name',
                          labelText: 'DELIVERY',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'CHANGE RESTAURANT',
                      style: TextStyle(fontSize: 20, color: Colors.amber),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Restaurant Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Enter New Restaurant Name',
                          labelText: 'RESTAURANT',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'RESET PASSWORD',
                      style: TextStyle(fontSize: 20, color: Colors.amber),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Password";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Enter New Password',
                          labelText: 'PASSWORD',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Password Reset Successful")));
                    }
                  },
                  child: const Text('Submit')),
            ),
          ],
        ),
      ),
    );
  }
}
