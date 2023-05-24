
import 'package:flutter/material.dart';
import 'package:intlphonefield/views/screen/AddContact.dart';
import 'package:intlphonefield/views/screen/AddContactDetails.dart';
import 'package:intlphonefield/Constants/String_Constants.dart';
import 'package:intlphonefield/views/screen/ContactSummery.dart';
import 'package:intlphonefield/views/screen/PaymentDetails.dart';
import 'package:intlphonefield/main.dart';
import 'package:intlphonefield/views/screen/PaymentMode.dart';

class NavigationRoute {
  static Route<dynamic> generateRoute(RouteSettings setting){

    switch(setting.name){

      case './':
        return MaterialPageRoute(builder: (_) =>const MyHomePage(title: home));

      case './AddContact':
        return MaterialPageRoute(builder: (_) =>const AddContact());

      case './AddContactDetails':
        return MaterialPageRoute(builder: (_) =>const AddContactDetails());

      case './paymentMode':
        return MaterialPageRoute(builder: (_) =>const PaymentMode());

      case './paymentDetails':
        return MaterialPageRoute(builder: (_) =>const PaymentDetails());

      case './contactSummery':
        return MaterialPageRoute(builder: (_) =>const ContactSummery());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}