import 'package:flutter/material.dart';

import '../util/meal.dart';

class Meals extends StatefulWidget {
  const Meals({Key? key}) : super(key: key);

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals"),
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 10,
          ),
          Meal(
              image: 'pilau.jfif',
              name: 'PILAU',
              description: 'Plain  Pilau  Served Hot',
              price: 1570,
              order: 'Order'),
          Meal(
              image: 'choma.jfif',
              name: 'BEEF CHOMA',
              description: 'Choma served with ugali',
              price: 200,
              order: 'Order'),
          Meal(
              image: 'fish.jfif',
              name: 'FISH',
              description: 'Tasty  Medium  lake Fish',
              price: 750,
              order: 'Order'),
          Meal(
              image: 'fry.jfif',
              name: 'BEEF FRY',
              description: 'Fry  Served   With   Ugali',
              price: 2500,
              order: 'Order'),
          Meal(
              image: 'matoke.jfif',
              name: 'MATOKE',
              description: 'Matoke Served With Rice',
              price: 850,
              order: 'Order'),
          Meal(
              image: 'muthokoi.jfif',
              name: 'MUTHOKOI',
              description: 'Plain  Muthokoi  Served',
              price: 500,
              order: 'Order'),
          Meal(
              image: 'omelete.jfif',
              name: 'OMELETE',
              description: 'Tasty  Italian   Omelete',
              price: 3500,
              order: 'Order'),
          Meal(
              image: 'omena.jfif',
              name: 'OMENA',
              description: 'Omena Serve with Ugali',
              price: 350,
              order: 'Order'),
          Meal(
              image: 'pizza.jfif',
              name: 'PIZZA',
              description: 'Medium cheese Pizza',
              price: 3700,
              order: 'Order'),
        ],
      ),
    );
  }
}
