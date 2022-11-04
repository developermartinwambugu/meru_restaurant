import 'package:flutter/material.dart';
import 'package:merurestaurant/pages/help.dart';
import 'package:merurestaurant/pages/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:merurestaurant/pages/orders.dart';
import 'package:merurestaurant/pages/rooms.dart';
import 'package:merurestaurant/pages/settings.dart';
import 'bill.dart';
import 'login.dart';
import 'meals.dart';

class MyDashboard extends StatefulWidget {
  String user;
  MyDashboard({super.key, required this.user});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESTAURANT'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 82, 218, 89)),
                child: UserAccountsDrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 82, 218, 89)),
                  accountName: Text(widget.user),
                  accountEmail: Text('${widget.user}@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/user.png'),
                  ),
                )),
            const Divider(
              height: 0.2,
            ),
            ListTile(
              title: const Text('Dashboard'),
              leading: const Icon(Icons.dashboard),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyDashboard(
                        user: widget.user,
                      ),
                    ));
              },
            ),
            const Divider(
              height: 0.2,
            ),
            ListTile(
              title: const Text('Meals'),
              leading: const Icon(Icons.set_meal_sharp),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Meals()));
              },
            ),
            const Divider(
              height: 0.2,
            ),
            ListTile(
              title: const Text('Rooms'),
              leading: const Icon(Icons.room_service),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyRooms(),
                    ));
              },
            ),
            const Divider(
              height: 0.2,
            ),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Setting(),
                    ));
              },
            ),
            const Divider(
              height: 0.2,
            ),
            ListTile(
              title: const Text('My Orders'),
              leading: const Icon(Icons.add_shopping_cart),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyOrders()));
              },
            ),
            const Divider(
              height: 0.2,
            ),
            ListTile(
              title: const Text('Billing'),
              leading: const Icon(Icons.account_balance_wallet),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Bill()));
              },
            ),
            const Divider(
              height: 0.2,
            ),
            ListTile(
              title: const Text('Help'),
              leading: const Icon(Icons.help),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Help(),
                    ));
              },
            ),
            const Divider(
              height: 0.2,
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const Login()),
                    (Route<dynamic> route) => false);
                Fluttertoast.showToast(
                    msg: "Logged out Successful",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.cyan,
                    fontSize: 16.0);
              },
            )
          ],
        ),
      ),
      body: Center(child: HomePage()),
    );
  }
}
