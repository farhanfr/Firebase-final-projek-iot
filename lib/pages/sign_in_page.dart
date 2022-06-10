// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase_iot/pages/home/home_page.dart';
import 'package:test_firebase_iot/constants/theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    void _toggle() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }

    return Scaffold(
      backgroundColor: greyBgColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(edge),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(edge),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - (2 * edge),
                    height: MediaQuery.of(context).size.height / 2.8,
                    decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Image.asset(
                      'assets/images/icon.png',
                    ),
                    padding: EdgeInsets.all(80),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Text(
                    'Hello Again!',
                    style: blackTextStyle.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Wellcome back you’ve\nbeen missed! :',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  TextFormField(
                    decoration: inputDecoration.copyWith(
                      label: Text(
                        'Masukkan email',
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (String? value) {
                      // Validation condition
                      if (value!.trim().isEmpty) {
                        return 'Tolong isikan Email';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: _obscureText,
                    decoration: inputDecoration.copyWith(
                      label: Text(
                        'Masukkan Password',
                      ),
                      hintText: "Password",
                      suffixIcon: InkWell(
                        onTap: _toggle,
                        child: Icon(
                          _obscureText
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                          size: 15.0,
                          color: greyColor,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    validator: (String? value) {
                      // Validation condition
                      if (value!.trim().isEmpty) {
                        return 'Tolong isikan Password';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const CircularProgressIndicator(),
                          ],
                        )
                      : Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - (2 * edge),
                          child: RaisedButton(
                            onPressed: () => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              ),
                            },
                            color: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Text(
                              'Masuk',
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: edge),
                  Text(errorMessage, style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
