import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Constants/String_Constants.dart';
import 'config/route/NavigationRoute.dart';

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
      onGenerateRoute: NavigationRoute.generateRoute,
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

  String firstNameStr = firstName;
  String lastNameStr = lastName;
  String emailStr = email;

  late SharedPreferences sharedPreferences;

  void _setState()async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      firstNameStr = sharedPreferences.getString(firstName) ?? firstName;
      lastNameStr = sharedPreferences.getString(firstName) ?? firstName;
      emailStr = sharedPreferences.getString(firstName) ?? firstName;
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
            Text(home),
          ],
        ),
      ),
      drawer: Drawer(
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
                accountName: const Text(
                  "$firstName $lastName",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: const Text(email),
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
