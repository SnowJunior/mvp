import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:updater/constants/constants.dart';
import 'package:updater/view/supplier_order_list_view.dart';

import '../api/pdf_api.dart';
import '../api/pdf_invoice_api.dart';
import '../data/model/customer_view_model.dart';
import '../data/model/invoice_view_model.dart';
import '../data/model/supplier_view_model.dart';


class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreemState();
}

final userNameController = TextEditingController();
final fruitController = TextEditingController();
final quantityController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _CustomerScreemState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference order = FirebaseFirestore.instance.collection('Order');
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Place Your Order",
                  style: headingStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: userNameController,
                  validator: (value) {
                    if (value == null && value!.isEmpty) {
                      return 'Please fill in field';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    label: Text(
                      "Customer Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: fruitController,
                  validator: (value) {
                    if (value == null && value!.isEmpty) {
                      return 'Please fill in field';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    label: Text(
                      "Fruit Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: quantityController,
                  validator: (value) {
                    if (value == null && value!.isEmpty) {
                      return 'Please fill in field';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    label: Text(
                      "Quantity",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    MaterialButton(
                      shape: const StadiumBorder(),
                      onPressed: _populate,
                      child: Text(
                        "Order",
                        style: regularStyle,
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    MaterialButton(
                      shape: const StadiumBorder(),
                      onPressed: () {
                        order.add({
                          'name': userNameController.text,
                          'Fruit': fruitController.text,
                          'quantity': quantityController.text
                        }).then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Data entered")));
                        });
                      },
                      child: Text(
                        "Firestore",
                        style: regularStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      shape: const StadiumBorder(),
                      color: Colors.blue,
                      onPressed: () async {
                        // date definition
                        final date = DateTime.now();
                        final dueDate = date.add(const Duration(days: 7));

                        // Pdf details Creation

                        final invoice = Invoice(
                          supplier: const Supplier(
                              name: "Joseph Mabili",
                              address: "Somewhere In Kenya",
                              paymentInfo: "0794329992"),
                          customer: Customer(
                            name: userNameController.text,
                            address: "Kilifi",
                          ),
                          info: InvoiceInfo(
                              date: date,
                              dueDate: dueDate,
                              description: "My description......",
                              number: '${DateTime.now().year}-9090'),
                          items: [
                            InvoiceItem(
                              description: 'Mango',
                              date: DateTime.now(),
                              quantity: 3,
                              unitPrice: 20,
                            ),
                            InvoiceItem(
                              description: 'Dates',
                              date: DateTime.now(),
                              quantity: 8,
                              unitPrice: 10,
                            ),
                            InvoiceItem(
                              description: 'Orange',
                              date: DateTime.now(),
                              quantity: 3,
                              unitPrice: 15,
                            ),
                            InvoiceItem(
                              description: 'Apple',
                              date: DateTime.now(),
                              quantity: 8,
                              unitPrice: 20,
                            ),
                            InvoiceItem(
                              description: 'Guavas',
                              date: DateTime.now(),
                              quantity: 1,
                              unitPrice: 1.59,
                            ),
                            InvoiceItem(
                              description: 'Blue Berries',
                              date: DateTime.now(),
                              quantity: 5,
                              unitPrice: 100,
                            ),
                            InvoiceItem(
                              description: 'Lemon',
                              date: DateTime.now(),
                              quantity: 4,
                              unitPrice: 10,
                            ),
                          ],
                        );
                        final pdfProfile =
                            await PdfInvoiceApi.generate(invoice);

                        PdfApi.openFile(pdfProfile);
                      },
                      child: Text(
                        "Print Invoice",
                        style: regularStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _populate() {
    if (_formKey.currentState?.validate() == true) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            duration: const Duration(seconds: 3),
            backgroundColor: Theme.of(context).colorScheme.primary,
            content: Container(
              // clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "LOADING",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Please wait...",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      )
                    ],
                  ),
                  CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(
                      Theme.of(context).colorScheme.onPrimary,
                    ),
                  )
                ],
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
          ),
        );
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => OrderList()),
          ),
        );
      });
    }
  }
}
