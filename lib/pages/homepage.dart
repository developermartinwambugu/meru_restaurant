import 'package:flutter/material.dart';

import '../util/category.dart';
import '../util/hotel_detail.dart';
import '../util/recommended.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        leading: const Icon(
          Icons.location_on_outlined,
          color: Colors.red,
        ),
        title: const Text(
          "Meru, Kenya",
          style: TextStyle(color: Colors.black, fontSize: 15.0),
        ),
        actions: const [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          // right: 10.0,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //top text
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            const Text(
              "Let's Find The Best Hotel",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            //search bar
            const SizedBox(
              height: 15.0,
            ),
            Container(
              width: 300.0,
              height: 50.0,
              margin: const EdgeInsets.only(left: 10.0),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            //scralling list 1
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 30.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Category("Nearest"),
                  Category("Popular"),
                  Category("Top Rates"),
                  Category("Trending"),
                  Category("Trending"),
                  Category("Trending"),
                  Category("Trending"),
                ],
              ),
            ),

            //scrolling containers 2
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  HotelContainer("Serena Beach", "Mombasa", "hotel2.jpeg"),
                  HotelContainer("Silver Rock", "Malindi", "hotel3.jpeg"),
                  HotelContainer("PridInn Paradise", "Kwale", "hotel1.jpeg"),
                  HotelContainer("Serena Beach", "Mombasa", "hotel2.jpeg"),
                  HotelContainer("Silver Rock", "Malindi", "hotel3.jpeg"),
                ],
              ),
            ),
            //text
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recomended Hotels",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "see more",
                    style: TextStyle(color: Colors.red[300]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            //recomended hotels listview
            Expanded(
              child: ListView(
                children: [
                  RecomendeHotelCard(
                      "Paradiso ", "Mombasa", "103", "4.2", "hotel3.jpeg"),
                  RecomendeHotelCard(
                      "Grand Palace", "Mombasa", "120", "5.0", "hotel2.jpeg"),
                  RecomendeHotelCard(
                      "Blue Nile", "Kwale", "95", "4.5", "hotel1.jpeg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
