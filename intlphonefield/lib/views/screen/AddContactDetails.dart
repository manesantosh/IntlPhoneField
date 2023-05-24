
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddContactDetails extends StatefulWidget{
  const AddContactDetails({super.key});

  @override
  State<AddContactDetails> createState() => _AddContactDetailsState();
}

class _AddContactDetailsState extends State<AddContactDetails> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNameController = TextEditingController();
  late SharedPreferences sharedPreferences;
  final _formKey = GlobalKey<FormState>();


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
                  Icon(Icons.looks_3),
                ],
              ),
              const SizedBox(height: 40),
              const Text("Add contact details", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
              const SizedBox(height: 40),

              Form(
                key: _formKey,
                child: Column(
                  children: [

                    Align(
                      alignment: Alignment.centerLeft,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(230, 230, 250, 0.3019607843137254).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(80),
                              border: Border.all(color: Colors.deepPurple.withOpacity(0.2)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(Icons.person, color: Colors.lightBlue.withOpacity(0.25), size: 120,),
                          )
                      ),
                    ),

                    const SizedBox(height: 20),

                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(230, 230, 250, 0.3019607843137254),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.deepPurple.withOpacity(0.2))
                      ),
                      child: TextFormField(
                         inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r"[a-zA-Z]+|\s"),
                            )
                         ],
                        decoration: const InputDecoration(
                            labelText: 'First Name',
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                            border: InputBorder.none,
                        ),
                        controller: firstNameController,
                        validator: (value){
                          if(!value!.isValidName){
                            return 'Enter valid first name';
                          }else {
                            return null;
                          }
                        }
                      ),
                    ),

                    const SizedBox(height: 20),

                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(230, 230, 250, 0.3019607843137254),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.deepPurple.withOpacity(0.2))
                      ),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z]+|\s"),
                          )
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                          border: InputBorder.none,
                        ),
                        controller: lastNameController,
                        validator: (value){
                           if(!value!.isValidName){
                             return 'Enter valid last name';
                           }else {
                             return null;
                           }
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(230, 230, 250, 0.3019607843137254),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.deepPurple.withOpacity(0.2))
                      ),
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[0-9]"),
                          )
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                          border: InputBorder.none,
                        ),
                        controller: phoneNameController,
                        validator: (value){
                          if(!value!.isValidPhone){
                            return 'Enter valid phone number';
                          }else {
                            return null;
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(230, 230, 250, 0.3019607843137254),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.deepPurple.withOpacity(0.2))
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                          border: InputBorder.none,
                        ),
                        controller: emailController,
                        validator: (value){
                          if(!value!.isValidEmail){
                            return 'Enter valid email';
                          }else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
              ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        storeValuesInSharedPref();
                        Navigator.pushNamed(context, "./paymentMode");
                      }
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
          ]
        ),
      )
    );
  }

  void storeValuesInSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("first_name", firstNameController.text);
    sharedPreferences.setString("last_name", lastNameController.text);
    sharedPreferences.setString("email", emailController.text);
    sharedPreferences.setString("phone", phoneNameController.text);
  }
}

extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName{
    final nameRegExp = RegExp(r"[a-zA-Z]+|\s");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword{
    final passwordRegExp =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull{
    return this!=null;
  }

  bool get isValidPhone{
    final phoneRegExp = RegExp(r"[0-9]");
    return phoneRegExp.hasMatch(this);
  }

}