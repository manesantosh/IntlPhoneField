
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentDetails extends StatefulWidget{
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {

  TextEditingController accountNumber = TextEditingController();
  TextEditingController routingNumber = TextEditingController();
  TextEditingController bankName = TextEditingController();

  var items = [
    'Emergency Account',
    'Business savings',
  ];
  String dropdownValue = 'Emergency Account';
  late SharedPreferences sharedPreferences;

  void storeValuesInSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("accountNumber", accountNumber.text);
    sharedPreferences.setString("routingNumber", routingNumber.text);
    sharedPreferences.setString("accountType", dropdownValue);
    sharedPreferences.setString("bankName", bankName.text);
  }

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

            DecoratedBox(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(230, 230, 250, 0.3019607843137254),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.deepPurple.withOpacity(0.2))
                ),
                child: TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[0-9]"),
                    )
                  ],
                  controller: accountNumber,
                  decoration: const InputDecoration(
                    labelText: "Account Number",
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    border: InputBorder.none,
                  ),
                )
            ),

              const SizedBox(height: 20),

              DecoratedBox(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(230, 230, 250, 0.3019607843137254),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.deepPurple.withOpacity(0.2))
                  ),
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[0-9]"),
                      )
                    ],
                    controller: routingNumber,
                    decoration: const InputDecoration(
                      labelText: "Routing Number",
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      border: InputBorder.none,
                    ),
                  )
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(230, 230, 250, 0.3019607843137254),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.deepPurple.withOpacity(0.2))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:30, right:30),
                    child: Stack(
                      children: [
                        DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: dropdownValue,
                          isExpanded: true,
                          elevation: 0,
                          dropdownColor: const Color.fromRGBO(230, 230, 250, 1),
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
                        )
                      ),
                    ]),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              DecoratedBox(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(230, 230, 250, 0.3019607843137254),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.deepPurple.withOpacity(0.2))
                  ),
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z]+|\s"),
                      )
                    ],
                    controller: bankName,
                    decoration: const InputDecoration(
                      labelText: "Bank",
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      border: InputBorder.none,
                    ),
                  )
              ),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){

                        storeValuesInSharedPref();
                        Navigator.pushNamed(context, "./contactSummery");
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
          ])
    )
    );
  }
}