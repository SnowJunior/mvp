import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Enums/enum.dart';
import '../constants/constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

TextEditingController verMobileNo = TextEditingController();

TextEditingController verPassword = TextEditingController();

Status type = Status.login;

final _formKey = GlobalKey<FormState>();
final _firebaseAuth = FirebaseAuth.instance;

class _SignInScreenState extends State<SignInScreen> {
  bool _isLoading = false;

  void loading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          child: Text(
                            'Login',
                            style: headingStyle,
                          ),
                          alignment: Alignment.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
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
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                            ),
                            label: Text(
                              'Enter Password',
                              style: labelStyle,
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        // if(type == Status.signup)
                        // const SignUpScreen(),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: _isLoading
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : MaterialButton(
                                            shape: const StadiumBorder(),
                                            onPressed: () => _firebaseAuth.signInWithEmailAndPassword(email: verMobileNo.text, password: verPassword.text),
                                            
                                            child:  Text(
                                              type == Status.login
                                                  ? 'Login'
                                                  : 'Sign Up',
                                            ),
                                          ),
                                  ),
                                ]),
                          ),
                        ),
                        // MaterialButton(
                        //   onPressed: () {},
                        //   color: Colors.black,
                        //   shape: const StadiumBorder(),
                        //   child: const Text(
                        //     'Login',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
