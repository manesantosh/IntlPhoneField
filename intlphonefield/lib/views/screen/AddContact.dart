import 'package:flutter/material.dart';
import 'package:intlphonefield/Constants/String_Constants.dart';
import 'package:intlphonefield/config/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AddContact extends StatefulWidget{
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {

  late SharedPreferences sharedPreferences;
  String dropdownValue = "";
  var items =["", ""];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    items[0] = AppLocalizations.of(context)!.emergencyAccount;
    items[1] = AppLocalizations.of(context)!.businessAccount;
    dropdownValue = AppLocalizations.of(context)!.emergencyAccount;

    return  GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.looks_one, color: Colors.blue),
                  Icon(Icons.looks_two),
                  Icon(Icons.looks_3),
                ],
              ),
              const SizedBox(height: 40),
              Text(AppLocalizations.of(context)!.bankAccountDetailText,
                style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              const SizedBox(height: 20),
              Text(AppLocalizations.of(context)!.bankAccountDetailSubText,
                style: const TextStyle(
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
                        color: CustomColors.grey200,
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
                        color: CustomColors.white100,
                        child:  Text(
                          AppLocalizations.of(context)!.createAnAccount,
                          style: const TextStyle(color: Colors.deepPurple, fontSize: 12),
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
                        backgroundColor: MaterialStateProperty.all<Color>(CustomColors.purple100 ),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.continueText,
                        style: const TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}