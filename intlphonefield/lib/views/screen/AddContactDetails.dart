
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intlphonefield/Constants/String_Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(addContact, style: TextStyle(
              color: Colors.black
          ),),
          centerTitle: true,
          backgroundColor: const Color(0xFFFFFFFF),
          elevation: 0,
        ),
        body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListView(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                  RegExp(nameRegExpConst),
                                )
                              ],
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.firstNameConst,
                                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                RegExp(nameRegExpConst),
                              )
                            ],
                            decoration: const InputDecoration(
                              labelText: lastNameConst,
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
                                RegExp(phoneRegExpConst),
                              )
                            ],
                            decoration: const InputDecoration(
                              labelText: phoneConst,
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
                              labelText: emailConst,
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
                ]
                ),
          ),
        persistentFooterAlignment: AlignmentDirectional.bottomCenter,
        persistentFooterButtons: [
          Align(
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
          )
        ],
      ),
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
    final emailRegExp = RegExp(emailRegExpConst);
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName{
    final nameRegExp = RegExp(nameRegExpConst);
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword{
    final passwordRegExp = RegExp(passwordRegExpConst);
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone{
    final phoneRegExp = RegExp(phoneRegExpConst);
    return phoneRegExp.hasMatch(this);
  }

}