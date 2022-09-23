import 'package:flutter/material.dart';
import 'package:updater/constants/constants.dart';
import 'package:updater/screens/password_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

const emailRegex =
    r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

// Controller for fields
TextEditingController userName = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController mobileNo = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Register Form for new user
                    // UserName
                    TextFormField(
                      validator: (value) {
                        if (value == null && value!.isEmpty) {
                          return 'Please fill in Name';
                        } else if (value.length < 2 && value.length > 20) {
                          return 'Name must be more than 2 characters';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        label: Text(
                          'FullName',
                          style: labelStyle,
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Email set
                    TextFormField(
                      validator: (value) {
                        if (!RegExp(emailRegex)
                            .hasMatch(value!.trim().toLowerCase())) {
                          return 'email must be valid';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          label: Text(
                            'Email Address',
                            style: labelStyle,
                          )),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Setup Mobile number
                    TextFormField(
                      controller: mobileNo,
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
                      height: 40,
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        children: [
                          Text(
                            'Next',
                            style: regularStyle,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      const PasswordScreen()),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
