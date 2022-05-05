// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountDetail extends StatefulWidget {
  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _fullNameTextController = TextEditingController();
  final _phoneNumberTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _getAccount();
  }

  _getAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('email') != null) {
      setState(() {
        _emailTextController.text = prefs.getString('email') ?? ''; // if - null
        //print(prefs.getString('email'));
      });
    }
    if ((prefs.getString('fullName') != null) &&
        (prefs.getString('phoneNumber') != null) &&
        (prefs.getString('address') != null)) {
      _fullNameTextController.text = prefs.getString('fullName') ?? '';
      _phoneNumberTextController.text = prefs.getString('phoneNumber') ?? '';
      _addressTextController.text = prefs.getString('address') ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            fullnameTextFormField(),
            const SizedBox(
              height: 10,
            ),
            emailTextFormField(),
            const SizedBox(
              height: 10,
            ),
            addressTextFormField(),
            const SizedBox(
              height: 10,
            ),
            phoneNumberTextFormField(),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  Fluttertoast.showToast(
                      msg: "Save successfull",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('fullName', _fullNameTextController.text);
                  prefs.setString(
                      'phoneNumber', _phoneNumberTextController.text);
                  prefs.setString('address', _addressTextController.text);
                  Navigator.pop(context, _emailTextController.text);
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                child: const Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField fullnameTextFormField() {
    return TextFormField(
      controller: _fullNameTextController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your full name ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.person)),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      enabled: false,
      controller: _emailTextController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your email ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)),
    );
  }

  TextFormField addressTextFormField() {
    return TextFormField(
      controller: _addressTextController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your address",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
    );
  }

  TextFormField phoneNumberTextFormField() {
    return TextFormField(
      controller: _phoneNumberTextController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your phone number",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
    );
  }
}
