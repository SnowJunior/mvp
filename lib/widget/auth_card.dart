import 'package:flutter/material.dart';
import 'package:updater/constants/constants.dart';

class AuthCard extends StatelessWidget {
  const AuthCard(
      {Key? key, required this.title, required this.buttonText, this.onPressed})
      : super(key: key);

  final String title;
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: SizedBox(
        width: size.width * .4,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Icon(
                Icons.person,
                size: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: headingStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  
                },
                shape: const StadiumBorder(),
                child: Text(
                  buttonText,
                  style: regularStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
