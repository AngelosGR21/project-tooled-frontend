import 'package:flutter/material.dart';
import '../../Utils/user_data.dart';
import 'appbar_widget.dart';

// Handles the Page to edit the Username Section of the User Profile.
class EditUsernameFormPage extends StatefulWidget {
  const EditUsernameFormPage({Key? key}) : super(key: key);

  @override
  State<EditUsernameFormPage> createState() => _EditUsernameFormPageState();
}

class _EditUsernameFormPageState extends State<EditUsernameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  void updateUserValue(String username) {
    user.username = username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
                width: 330,
                child: Text(
                  "What's your username?",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                    child: SizedBox(
                        height: 100,
                        width: 300,
                        child: TextFormField(
                          // Handles form validation username
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          decoration:
                              const InputDecoration(labelText: 'Username'),
                          controller: userNameController,
                        ))),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      width: 330,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise
                          if (_formKey.currentState!.validate()) {
                            // ignore: prefer_interpolation_to_compose_strings
                            updateUserValue(userNameController.text);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(fontSize: 15),
                        ),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
