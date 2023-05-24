
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intlphonefield/model/PaymentMethodModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentMode extends StatefulWidget{
  const PaymentMode({super.key});

  @override
  State<PaymentMode> createState() => _PaymentModeState();
}

class _PaymentModeState extends State<PaymentMode> {

  late SharedPreferences sharedPreferences;

  Future<void> _setValueToSharedPref(String value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("paymentMethod", value);
  }

  final List<PaymentMethodModel> paymentMethod = [
    PaymentMethodModel( "icon", "Intrabank", "Send funds via intrabank"),
    PaymentMethodModel( "icon", "Card", "Send funds via a Card"),
    PaymentMethodModel( "icon", "Check", "Make a payment via a Check"),
    PaymentMethodModel( "icon", "domestic Wire", "Send funds via Domestic Wire"),
    PaymentMethodModel( "icon", "ACH", "Send funds via ACH")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("Add Contact", style: TextStyle(
              color: Colors.black
          ),),
          centerTitle: true,
          backgroundColor: const Color(0xFFFFFFFF),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.looks_one, color: Colors.blue),
                Icon(Icons.looks_two, color: Colors.blue),
                Icon(Icons.looks_3, color: Colors.blue),
              ],),
            const SizedBox(height: 40),
            const Text("Select payment mode", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
            const SizedBox(height: 20),
                const Text("By selecting a payment mode, you're essentially choosing the method you'll use to transfer money to your contact",
                  style: TextStyle(
                    fontSize: 16
                ),),
            const SizedBox(height: 40),
           ListView.builder(
             itemCount: paymentMethod.length,
             scrollDirection: Axis.vertical,
             shrinkWrap: true,
             itemBuilder: (BuildContext context, int index) {
               return ListTile(onTap: (){
                _setValueToSharedPref(paymentMethod[index].method);
                 Navigator.pushNamed(context, './paymentDetails');
               },
                 leading: const Icon(Icons.comment_bank),
                 title: Text(paymentMethod[index].method),
                 subtitle: Text(paymentMethod[index].subText),
                 trailing: const Icon(Icons.arrow_forward),
               );
               },
           ),
          ]),
        )
    );
  }
}