import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

TextEditingController verMobileNo = TextEditingController();

TextEditingController verPassword = TextEditingController();

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Align(child: Text('Login',style: headingStyle,),
                      alignment: Alignment.center,),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: verMobileNo,
                        validator: (value) {
                          if (value!.isEmpty &&
                              value.length < 2 &&
                              value.length > 10) {
                            return 'Enter a valid phone Number';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Colors.black, width: 1.0),
                          ),
                          label: Text(
                            'Enter Mobile Number',
                            style: labelStyle,
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: verPassword,
                        validator: (value) {
                          if (value == null && value!.isEmpty) {
                            return 'Password is required';
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Colors.black, width: 1.0),
                          ),
                          label: Text(
                            'Enter Password',
                            style: labelStyle,
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(onPressed: () {},
                      color: Colors.black,
                      shape: const StadiumBorder(),
                      child: const Text('Login',style: TextStyle(color: Colors.white,),),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
