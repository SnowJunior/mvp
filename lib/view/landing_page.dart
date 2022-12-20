import 'package:flutter/material.dart';
import 'package:updater/widget/auth_card.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 170),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      // Screens that can be Selected
                      // Customer Side
                      AuthCard(
                        title: "Customer",
                        buttonText: "Select",
                        onPressed: () {},
                      ),

                      const Spacer(),

                      // Supplier Side
                      AuthCard(
                        title: "Supplier",
                        buttonText: "Select",
                        onPressed: () {},
                      ),

                      
                      // Card(
                      //   elevation: 10,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      //   child: SizedBox(
                      //     width: size.width * .4,
                      //     height: 200,
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(15),
                      //       child: Column(
                      //         children: [
                      //           const Icon(
                      //             Icons.person,
                      //             size: 50,
                      //           ),
                      //           const SizedBox(
                      //             height: 10,
                      //           ),
                      //           Text(
                      //             'Supplier',
                      //             style: regularStyle,
                      //           ),
                      //           const SizedBox(height: 20),
                      //           TextButton(
                      //             onPressed: () {
                      //               Navigator.push(
                      //                   context,
                      //                   MaterialPageRoute(
                      //                       builder: (builder) =>
                      //                           const InvoicePrint()));
                      //             },
                      //             child: Text(
                      //               'Select',
                      //               style: regularStyle,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
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
