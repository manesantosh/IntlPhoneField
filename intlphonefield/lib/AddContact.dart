import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddContact extends StatefulWidget{
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {

  late SharedPreferences sharedPreferences;

  var items = [
    'Emergency Account',
    'Business savings',
  ];
  String dropdownValue = 'Emergency Account';


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                Icon(Icons.looks_two),
                Icon(Icons.looks_3),
              ],
            ),
            const SizedBox(height: 40),
            const Text("Add your bank details", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
            const SizedBox(height: 20),
            const Text("Adding your bank account details will allow you to easily send and receive money to add from your contacts.",
              style: TextStyle(
               fontSize: 16,
              ),
            ),
            const SizedBox(height: 40),

            Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                      color: const Color.fromRGBO(230, 230, 250, 0.3019607843137254),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.deepPurple)
                    ),
                    child: Padding(
                    padding: const EdgeInsets.only(left:30, right:30),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: dropdownValue,
                        isExpanded: true,
                        elevation: 0,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ),
                ),
                ),
                  ),
                  Positioned(
                    left: 20,
                    top: 8,
                    child: Container(
                      color: const Color.fromRGBO(230, 230, 250, 0.9),
                      child: const Text(
                        'Create an account',
                        style: TextStyle(color: Colors.deepPurple, fontSize: 12),
                      ),
                    ),
                  ),
              ]),
            
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "./AddContactDetails");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(93, 63, 211, 0.7)),
                    ),
                    child: const Text("continue", style: TextStyle(
                        color: Colors.white
                    ),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}