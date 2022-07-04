// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooled/pages/edit_password.dart';
import 'package:tooled/pages/edit_username.dart';
import '../pages/edit_name.dart';
import '../widgets/display_image_widget.dart';
import '../user/user_data.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = UserData.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 10,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text("Edit Profile",
                style: GoogleFonts.bebasNeue(fontSize: 35)),
          ),
        ),
        InkWell(
          onTap: () {},
          child: DisplayImage(
            imagePath: user.avatar,
            onPressed: () {},
          ),
        ),
        SizedBox(height: 35),
        buildUserInfoDisplay(user.name, 'Name', EditNameFormPage()),
        buildUserInfoDisplay(user.username, 'Username', EditUsernameFormPage()),
        buildUserInfoDisplay(user.password, 'Password', EditPasswordFormPage()),
      ]),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ))),
                child: Row(children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            navigateSecondPage(editPage);
                          },
                          child: Text(
                            getValue,
                            style: TextStyle(
                                fontSize: 20, height: 1.4, color: Colors.black),
                          ))),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  )
                ]),
              )
            ],
          ));

  // Refresh the page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
