import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:firebase_core/firebase_core.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController polynomialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Form'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: loginController,
              decoration: InputDecoration(labelText: 'Login'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a login value.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: polynomialController,
              decoration: InputDecoration(labelText: 'Polynomial'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a polynomial.';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Get the input polynomial as a string
                  String polynomial = polynomialController.text;

                  // Calculate the derivatives
                  List<String> derivatives = calculateDerivatives(polynomial);

                  // Save the results to Firebase Firestore
                  await saveResultsToFirestore(derivatives);

                  // Clear the form fields
                  loginController.clear();
                  passwordController.clear();
                  polynomialController.clear();

                  // Show a success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Results saved to Firebase Firestore.'),
                    ),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to calculate derivatives using math_expressions library
  List<String> calculateDerivatives(String polynomial) {
    try {
      // Parse the input polynomial
      Parser p = Parser();
      Expression exp = p.parse(polynomial);

      // Calculate the derivative
      Expression derivative = exp.derive('x');
      return [derivative.toString()];
    } catch (e) {
      print('Error calculating derivatives: $e');
      return [];
    }
  }

  // Function to save results to Firebase Firestore
  Future<void> saveResultsToFirestore(List<String> derivatives) async {
    try {
      // Initialize Firebase Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Reference to a Firestore collection (replace 'results' with your desired collection name)
      CollectionReference resultsCollection = firestore.collection('results');

      // Add a new document with a generated ID
      await resultsCollection.add({
        'timestamp': DateTime.now(),
        'login': loginController.text,
        'password': passwordController.text,
        'polynomial': polynomialController.text,
        'derivatives': derivatives,
      });
    } catch (e) {
      // Handle any errors that occur during Firestore operations
      print('Error saving to Firestore: $e');
    }
  }
}
