import 'package:flutter/material.dart';

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bills"),
      ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
