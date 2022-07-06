// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import './pages/favourites.dart';
import 'pages/home1.dart';
import './pages/inbox.dart';
import './pages/listing.dart';
import './pages/profile.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

int _selectedIndex = 0;

class _NavigationState extends State<Navigation> {
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    Favourites(),
    Listing(),
    Inbox(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Container(
            color: Colors.black,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 7,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.all(16),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey.shade700,
                  backgroundColor: Colors.black,
                  color: Colors.white,
                  onTabChange: _navigateBottomBar,
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.favorite_border,
                      text: 'Likes',
                    ),
                    GButton(
                      icon: Icons.new_label,
                      text: 'New',
                    ),
                    GButton(
                      icon: Icons.message,
                      text: 'Inbox',
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'Profile',
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
