import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Constants/String_Constants.dart';
import 'config/route/NavigationRoute.dart';
import 'config/theme/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intlphonefield/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L18n.all,

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

   String firstNameStr = "first name";
   String lastNameStr = "last name";
   String emailStr = "email";

  late SharedPreferences sharedPreferences;

  void _setState(BuildContext context)async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      firstNameStr = sharedPreferences.getString("first_name") ?? AppLocalizations.of(context)!.firstNameConst;
      lastNameStr = sharedPreferences.getString("last_name") ?? AppLocalizations.of(context)!.lastNameConst;
      emailStr = sharedPreferences.getString("email") ?? AppLocalizations.of(context)!.emailConst;
    });
  }

  @override
  Widget build(BuildContext context) {
    _setState(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),

        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                  color: CustomColors.grey100,
                ),
                child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: CustomColors.grey100),
                  accountName: Text(
                    "$firstNameStr  $lastNameStr",
                    style: const TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text(emailStr),
                  currentAccountPictureSize: const Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      firstNameStr[0],
                      style: const TextStyle(fontSize: 30.0, color: Colors.blue),
                    ), //Text
                  ), //circleAvatar
                ),
              ),
              ListTile(
                title: Text(AppLocalizations.of(context)!.home),
                onTap: () {
                  Navigator.pushNamed(context, "./");
                },
                leading: const Icon(Icons.home_outlined),
              ),
              ListTile(
                title: const Text(addContact),
                onTap: () {
                  Navigator.pushNamed(context, "./AddContact");
                },
                leading: const Icon(Icons.contact_page_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
