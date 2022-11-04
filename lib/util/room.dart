import 'package:flutter/material.dart';
import 'package:merurestaurant/pages/orders.dart';

class Room extends StatelessWidget {
  const Room(
      {required this.image,
      required this.name,
      required this.description,
      required this.price,
      required this.order});

  final String image;
  final String name;
  final String description;
  final double price;
  final String order;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 125,
              child: Image.asset('assets/' + image),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(color: Colors.cyan),
                  ),
                  Text(
                    'Description:',
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(description),
                  Text('Price: ' + price.toString()),
                  ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Room Ordered Successful")));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyOrders(),
                            ));
                      },
                      child: Text(order)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
