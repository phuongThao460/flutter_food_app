// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables, unused_element
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/ultilities.dart';
import 'package:flutter_food_app/model/user.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpForm extends StatefulWidget {
  
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isChecked = false;
  var prefs;

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Form(
        key: _passKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 1,
              ),
              TextFormField(
                validator: ((value) => Ultilities.validateEmail(value!)),
                onSaved: (value) {
                  setState(() {
                    _emailTextController.text = value!;
                  });
                },
                cursorColor: Colors.black,
                controller: _emailTextController,
                decoration: const InputDecoration(
                    hintText: "Enter your email here",
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0)),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 1,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: ((value) => Ultilities.validatePassword(value!)),
                onSaved: (value) {
                  setState(() {
                    _passwordTextController.text = value!;
                  });
                },
                cursorColor: Colors.black,
                controller: _passwordTextController,
                decoration: const InputDecoration(
                    hintText: "Enter your password here",
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0)),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 1,
              ),
              TextFormField(
                validator: ((value) {
                  var pass = _passKey.currentState?.value;
                  return Ultilities.conformPassword(pass, value!);
                }),
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                controller: _confirmTextController,
                decoration: const InputDecoration(
                    hintText: "Enter your confirm password here",
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0)),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 1,
              ),
              SizedBox(
                height: 1,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(
                          context,
                          User(
                              username: _emailTextController.text,
                              password: _passwordTextController.text));
                    }
                  },
                  child: const Text("Continue"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                          color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                      child: SvgPicture.asset('assets/icons/facebook-f.svg'),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                          color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                      child: SvgPicture.asset('assets/icons/google.svg'),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                          color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                      child: SvgPicture.asset('assets/icons/twitter.svg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
