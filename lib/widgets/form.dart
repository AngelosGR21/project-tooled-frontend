import 'package:flutter/material.dart';
import 'package:tooled/Utils/api.dart';
import '../navigation_bar.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  Credentials createState() => Credentials();
}

class Credentials extends State<FormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(fontSize: 15),
                    border: InputBorder.none,
                    hintText: 'Username',
                  ),
                  onChanged: (String value) {
                    setState(() {
                      username = value;
                    });
                  },
                  onFieldSubmitted: (String value) {
                    setState(() {
                      username = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(fontSize: 15),
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    return value!.isEmpty ? "This field cannot be empty" : null;
                  },
                  onChanged: (String value) {
                    setState(() {
                      password = value;
                    });
                  },
                  onFieldSubmitted: (String value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  primary: Colors.white,
                  padding: const EdgeInsets.all(16.0)),
              child: const Center(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  var snackBarMessage = "";
                  var result = await verifyCredentials(username, password);
                  if (result == 500) {
                    snackBarMessage =
                        "Something went wrong. Please try again..";
                  } else if (result == 400) {
                    snackBarMessage = "Incorrect username or password";
                  } else {
                    snackBarMessage = "Welcome back $username!";
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Navigation()));
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(snackBarMessage),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 25)
        ],
      ),
    );
  }
}
