import 'package:flutter/material.dart';
import 'package:intlphonefield/AddContact.dart';
import 'package:intlphonefield/ContactSummery.dart';
import 'package:intlphonefield/PaymentMode.dart';
import 'package:intlphonefield/PyamentDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AddContactDetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: './',
      routes: {
        './' : (context) => const MyHomePage(title: 'Home Screen'),
        './AddContact': (context) => const AddContact(),
        './AddContactDetails': (context) => const AddContactDetails(),
        './paymentMode': (context) => const PaymentMode(),
        './paymentDetails':(context) => const PaymentDetails(),
        './contactSummery': (context) => const ContactSummery()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title ;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String firstName = "firstName";
  String lastName = "lastName";
  String email = "email";

  late SharedPreferences sharedPreferences;

  void _setState()async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      firstName = sharedPreferences.getString("first_name") ?? "firstName";
      lastName = sharedPreferences.getString("last_name") ?? "lastName";
      email = sharedPreferences.getString("email") ?? "email";
    });
  }

  @override
  Widget build(BuildContext context) {
    _setState();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Home Screen',
            ),
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(211, 211, 211, 211),
              ),
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Color.fromARGB(
                    211, 211, 211, 211)),
                accountName: Text(
                  "$firstName $lastName",
                  style: const TextStyle(fontSize: 18),
                ),
                accountEmail: Text(email),
                currentAccountPictureSize: const Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    firstName[0],
                    style: const TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, "./");
              },
              leading: const Icon(Icons.home_outlined),
            ),
            ListTile(
              title: const Text('Add Contact'),
              onTap: () {
                Navigator.pushNamed(context, "./AddContact");
              },
              leading: const Icon(Icons.contact_page_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
