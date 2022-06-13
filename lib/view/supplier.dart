import 'package:flutter/material.dart';
import 'package:updater/constants/constants.dart';

class InvoicePrint extends StatelessWidget {
  const InvoicePrint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Text(
                      "Invoice",
                      style: headingStyle,
                    ),
                    const SizedBox(
                      height:20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey.withOpacity(.4),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
