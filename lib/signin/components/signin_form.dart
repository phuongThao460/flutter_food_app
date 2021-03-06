// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, unused_element, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_food_app/homepage/homepage.dart';
import 'package:flutter_food_app/model/ultilities.dart';
import 'package:flutter_food_app/model/user.dart';
import 'package:flutter_food_app/signup/signuppage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInForm extends StatefulWidget {
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isChecked = false;
  SharedPreferences? prefs;
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  late FToast fToast;

  @override
  void initState() {
    super.initState;
    fToast = FToast();
    fToast.init(context);
    _getData();
  }

  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('email')!.isNotEmpty) {
      _emailTextController.text = prefs.getString('email')!;
      _passwordTextController.text = prefs.getString('password')!;
      isChecked = prefs.getBool('check')!;
      Navigator.pushNamed(context, HomePage.routeName);
    } else {
      _emailTextController.text = "";
      _passwordTextController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Form(
              key: _formKey,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topRight,
                        child: Image.asset("dish.png")),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "Food Now",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 45,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Sign in with your email and password or continue \n with your social media",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              validator: (_value) {
                                return Ultilities.validateEmail(_value!);
                              },
                              onSaved: (_value) {
                                setState(() {
                                  _emailTextController.text = _value!;
                                });
                              },
                              cursorColor: Colors.black,
                              controller: _emailTextController,
                              decoration: const InputDecoration(
                                  hintText: "Enter your email here",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0)),
                                  prefixIcon: Icon(
                                    Icons.email_sharp,
                                    color: Colors.black,
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: ((value) =>
                                  Ultilities.validatePassword(value!)),
                              obscureText: true,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.black,
                              controller: _passwordTextController,
                              decoration: const InputDecoration(
                                  hintText: "Enter your password here",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0)),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  )),
                            ),
                            SizedBox(
                                height: 40,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value: isChecked,
                                      onChanged: (bool? value) async {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                    const Text("Remember your password")
                                  ],
                                )),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (isChecked &&
                                      _emailTextController.text.isNotEmpty &&
                                      _passwordTextController.text.isNotEmpty) {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString(
                                        "email", _emailTextController.text);
                                    prefs.setString("password",
                                        _passwordTextController.text);
                                    prefs.setBool('check', isChecked);
                                  } else {
                                    prefs!.remove('check');
                                  }

                                  Navigator.pushNamed(
                                      context, HomePage.routeName);
                                },
                                child: const Text("Continue"),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.green)),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
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
                                        color: Color(0xFFF5F6F9),
                                        shape: BoxShape.circle),
                                    child: SvgPicture.asset(
                                        'assets/icons/facebook-f.svg'),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    margin: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFF5F6F9),
                                        shape: BoxShape.circle),
                                    child: SvgPicture.asset(
                                        'assets/icons/google.svg'),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFF5F6F9),
                                        shape: BoxShape.circle),
                                    child: SvgPicture.asset(
                                        'assets/icons/twitter.svg'),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 14),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => SignUpPage()));
                                    final result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpPage()));
                                    User user = result as User;
                                    _emailTextController.text = user.username;
                                  },
                                  child: const Text(
                                    " Sign Up",
                                    style: TextStyle(
                                        color: Colors.redAccent, fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.bottomLeft,
                                child: Image.asset("dish_2.png"))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
