import 'package:flutter/material.dart';
import 'package:updater/constants/constants.dart';

class AuthCard extends StatelessWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Customer",
              style: headingStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Description",
              style: regularStyle,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {},
            shape: const StadiumBorder(),
            child: Text(
              'Select',
              style: regularStyle,
            ),
          ),
        ],
      ),
    );
  }
}
