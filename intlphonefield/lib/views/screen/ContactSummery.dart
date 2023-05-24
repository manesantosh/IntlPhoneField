import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactSummery extends StatefulWidget{
  const ContactSummery({super.key});

  @override
  State<ContactSummery> createState() => _ContactSummeryState();
}

class _ContactSummeryState extends State<ContactSummery> {
  late SharedPreferences sharedPreferences;

  String firstName = "firstName";
  String lastName = "lastName";
  String email = "email";
  String phone = "phone";
  String accountNumber = "accountNumber";
  String routingNumber = "routingNumber";
  String accountType = "accountType";
  String bankName = "bankName";
  String paymentMethod = "method";

  void _setState()async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      firstName = sharedPreferences.getString("first_name") ?? "";
      lastName = sharedPreferences.getString("last_name") ?? "";
      email = sharedPreferences.getString("email") ?? "";
      phone = sharedPreferences.getString("phone") ?? "";
      accountNumber = sharedPreferences.getString("accountNumber") ?? "";
      routingNumber = sharedPreferences.getString("routingNumber") ?? "";
      accountType = sharedPreferences.getString("accountType") ?? "";
      bankName = sharedPreferences.getString("bankName") ?? "";
      paymentMethod = sharedPreferences.getString("paymentMethod") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    _setState();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Summary", style: TextStyle(
            color: Colors.black
        ),),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:  const Color.fromRGBO(230, 230, 250, 0.3),
                        border: Border.all(color: Colors.blueAccent.withOpacity(0.7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(firstName[0], style: TextStyle(
                          fontSize: 45,
                          color: Colors.lightBlue.withOpacity(0.25)),
                        ),
                      )
                  ),
                ),
                const SizedBox(width: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$firstName $lastName", style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(email),
                    Text(phone)
                  ],
                ),
              ]
            ),
            const SizedBox(height: 50),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.comment_bank, color: Colors.deepPurple.withOpacity(0.4),),

                              const SizedBox(width: 10),

                              Text(paymentMethod, style: TextStyle(
                                  color: Colors.black.withOpacity(0.4)
                              ),),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Account Number", style: TextStyle(
                                color: Colors.black.withOpacity(0.4)
                              ),),

                              Text(accountNumber, style: TextStyle(
                                  color: Colors.black.withOpacity(0.4)
                              ),),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Routing Number", style: TextStyle(
                                  color: Colors.black.withOpacity(0.4)
                              ),),

                              Text(routingNumber, style: TextStyle(
                                  color: Colors.black.withOpacity(0.4)
                              ),),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Account Type", style: TextStyle(
                                  color: Colors.black.withOpacity(0.4)
                              ),),

                              const SizedBox(height: 10),

                              Text(accountType, style: TextStyle(
                                  color: Colors.black.withOpacity(0.4)
                              ),),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Bank Name", style: TextStyle(
                                  color: Colors.black.withOpacity(0.4)
                              ),),

                              Text(bankName, style: TextStyle(
                                  color: Colors.black.withOpacity(0.4)
                              ),),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "./");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(93, 63, 211, 0.7)),
                    ),
                    child: const Text("Confirm", style: TextStyle(
                        color: Colors.white
                    ),),
                  ),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}