import 'package:flutter/material.dart';

import '../pages/hotel_detail.dart';

class HotelContainer extends StatelessWidget {
  String name;
  String location;
  String imageurl;

  HotelContainer(this.name, this.location, this.imageurl);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailsPage(name, location, imageurl),
          ),
        );
        // print("$name");
      },
      child: Row(
        children: [
          Container(
            height: 300,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    height: 120,
                    // width: 50,
                    // image: AssetImage("/assets/images/hotel1.jpeg"),
                    image: AssetImage("assets/$imageurl"),
                  ),
                ),
                //text1
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  "$name",
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                //text 2
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text("$location"),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 35.0,
          )
        ],
      ),
    );
  }
}
