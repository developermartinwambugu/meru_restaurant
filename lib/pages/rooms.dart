import 'package:flutter/material.dart';
import 'package:merurestaurant/util/room.dart';

class MyRooms extends StatefulWidget {
  const MyRooms({Key? key}) : super(key: key);

  @override
  State<MyRooms> createState() => _MyRoomsState();
}

class _MyRoomsState extends State<MyRooms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms"),
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 10,
          ),
          Room(
              image: 'room1.jfif',
              name: 'SINGLE',
              description: 'A Single Room with room Service',
              price: 3000,
              order: 'Order'),
          Room(
              image: 'room2.jfif',
              name: 'BEDSITTER',
              description: 'A Bedsitter Room with room Service',
              price: 3500,
              order: 'Order'),
          Room(
              image: 'room3.jfif',
              name: '1 BEDROOM',
              description: 'A 1 Bedroom with room Service',
              price: 4000,
              order: 'Order'),
          Room(
              image: 'room4.jfif',
              name: '2 BEDROOM',
              description: 'A 2 Bedroom with room Service',
              price: 4500,
              order: 'Order'),
          Room(
              image: 'room5.jfif',
              name: 'VIP',
              description: 'A VIP Room with room Service',
              price: 5000,
              order: 'Order'),
          Room(
              image: 'room6.jfif',
              name: 'VVIP',
              description: 'A VVIP Room with room Service',
              price: 8000,
              order: 'Order'),
        ],
      ),
    );
  }
}
