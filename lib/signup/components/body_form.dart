// ignore_for_file: prefer_typing_uninitialized_variables, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/ultilities.dart';
import 'package:flutter_food_app/model/user.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyForm extends StatefulWidget {
  const BodyForm({Key? key}) : super(key: key);

  @override
  State<BodyForm> createState() => _BodyFormState();
}

class _BodyFormState extends State<BodyForm> {
  bool isChecked = false;
  var prefs;

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState;
    _getData();
  }

  _getData() async {
    prefs = await SharedPreferences.getInstance();
    if (!prefs.getString('username').isEmpty) {
      _emailTextController.text = prefs.getString('username');
      _emailTextController.text = prefs.getString('password');
      isChecked = prefs.getBool('check');
      //print(_value.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            emailTextFormField(),
            const SizedBox(
              height: 10,
            ),
            passwordTextFormField(),
            const SizedBox(
              height: 10,
            ),
            conformTextFormField(),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(
                        context,
                        User(
                            username: _emailTextController.text,
                            password: _confirmTextController.text));
                  }
                },
                child: const Text("Continue"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/facebook-f.svg"),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/google.svg"),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/twitter.svg"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      controller: _emailTextController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your email ",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)),
      validator: ((value) =>
          value != null ? Ultilities.validateEmail(value) : null),
      onSaved: (value) {
        if (value != null) {
          setState(() {
            _emailTextController.text = value;
          });
        }
      },
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
        key: _passKey,
        controller: _passwordTextController,
        obscureText: true,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter your password",
            // If  you are using latest version of flutter then lable text and hint text shown like this
            // if you r using flutter less then 1.20.* then maybe this is not working properly
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Icon(Icons.lock_outline)),
        validator: (passwordKey) {
          return Ultilities.validatePassword(passwordKey!);
        });
  }

  TextFormField conformTextFormField() {
    return TextFormField(
      controller: _confirmTextController,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Re-enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
      validator: (conformPassword) {
        var pass = _passKey.currentState?.value;
        return Ultilities.conformPassword(conformPassword!, pass);
      },
      onSaved: (value) {
        setState(() {
          _confirmTextController.text = value!;
        });
      },
    );
  }
}
