import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:updater/constants/constants.dart';

// ignore: must_be_immutable
class SupplierScreen extends StatelessWidget {
  SupplierScreen({Key? key}) : super(key: key);

  
  var name = '';
  var fruit = '';
  var quantity = 0;

  @override
  Widget build(BuildContext context) {
    CollectionReference supplies =
        FirebaseFirestore.instance.collection('FruitList');
    return Scaffold(
      body: SafeArea(
          child: Form(
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "WELCOME",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                onChanged: ((value) {
                  name = value;
                }),
                validator: (value) {
                  if (value == null && value!.isEmpty) {
                    return 'Please fill in field';
                  }
                  return null;
                },
                decoration:  InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  label: Text(
                    "Customer Name",
                    style: labelStyle
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: ((value) {
                  fruit = value;
                }),
                validator: (value) {
                  if (value == null && value!.isEmpty) {
                    return 'Please fill in field';
                  }
                  return null;
                },
                decoration:  InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  label: Text(
                    "Type of Fruit",
                    style: labelStyle
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: ((value) {
                  quantity = int.parse(value);
                }),
                validator: (value) {
                  if (value == null && value!.isEmpty) {
                    return 'Please fill in field';
                  }
                  return null;
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration:  InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  label: Text(
                    "Quantity",
                    style: labelStyle
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () {
                  supplies.add({
                    'name': name,
                    'fruit': fruit,
                    'number': quantity
                  }).then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Data entered")));
                  });
                },
                child: const Text(
                  "Populate",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
