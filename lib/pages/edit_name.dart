import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import '../user/user_data.dart';
import '../widgets/appbar_widget.dart';

// Handles the Page to edit the Name Section of the User Profile.
class EditNameFormPage extends StatefulWidget {
  const EditNameFormPage({Key? key}) : super(key: key);

  @override
  State<EditNameFormPage> createState() => _EditNameFormPageState();
}

class _EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firsNameController = TextEditingController();
  final secondNameController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    firsNameController.dispose();
    super.dispose();
  }

  void updateUserValue(String name) {
    user.name = name;
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
                  "What's Your Name?",
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
                        width: 150,
                        child: TextFormField(
                          // Handles form validation for first name
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your firstname';
                            } else if (!isAlpha(value)) {
                              return 'Only letters please';
                            }
                            return null;
                          },
                          decoration:
                              const InputDecoration(labelText: 'First Name'),
                          controller: firsNameController,
                        ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                    child: SizedBox(
                        height: 100,
                        width: 150,
                        child: TextFormField(
                          // Handles form validation for last name
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            } else if (!isAlpha(value)) {
                              return 'Only letters please';
                            }
                            return null;
                          },
                          decoration:
                              const InputDecoration(labelText: 'Last Name'),
                          controller: secondNameController,
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
                          if (_formKey.currentState!.validate() &&
                              isAlpha(firsNameController.text +
                                  secondNameController.text)) {
                            // ignore: prefer_interpolation_to_compose_strings
                            updateUserValue(firsNameController.text +
                                " " +
                                secondNameController.text);
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
