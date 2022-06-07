import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:updater/constants/constants.dart';
import 'package:updater/view/supplier.dart';

class OrderList extends StatelessWidget {
  OrderList({Key? key}) : super(key: key);

  final Stream<QuerySnapshot> ordersList =
      FirebaseFirestore.instance.collection('FruitList').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Text(
                  "List Of Orders Made",
                  style: headingStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: ordersList,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text(
                          "Something went wrong",
                          style: regularStyle,
                        );
                      } else {
                        final data = snapshot.requireData;

                        return Expanded(
                          child: ListView.builder(
                              itemCount: data.size,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(
                                    "${data.docs[index]['name']} \n ${data.docs[index]['Fruit']} \n ${data.docs[index]['quantity']}",
                                    style: regularStyle,
                                  ),
                                );
                              }),
                        );
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SupplierScreen()),
                      );
                    },
                    child: Text(
                      "Supplier",
                      style: regularStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
