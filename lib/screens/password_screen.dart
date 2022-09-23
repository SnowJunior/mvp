import 'package:flutter/material.dart';

import '../constants/constants.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

const passwordRegex = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";

TextEditingController password = TextEditingController();
TextEditingController cnfPassword = TextEditingController();

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  // Set Password
                  TextFormField(
                    controller: password,
                    validator: (value) {
                      if (!RegExp(passwordRegex).hasMatch(value!)) {
                        return 'Password is required';
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      label: Text(
                        'Set Password',
                        style: labelStyle,
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(
                    height: 20,

                    // Confirm Password
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null && value != password.text) {
                        return 'passwords do not match';
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      label: Text(
                        'Confirm Password',
                        style: labelStyle,
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
