import 'package:flutter/material.dart';
import 'package:merurestaurant/pages/orders.dart';

class Meal extends StatelessWidget {
  const Meal(
      {super.key,
      required this.image,
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
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(width: 150, child: Image.asset('assets/$image')),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(color: Colors.cyan),
                  ),
                  const Text(
                    'Description:',
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(description),
                  Text('Price: $price'),
                  ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Ordered Successful")));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyOrders(),
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
