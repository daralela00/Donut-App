import 'package:donut_app/pages/about_page.dart';
import 'package:donut_app/pages/chat_page.dart';
import 'package:donut_app/pages/home_page_selected.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    HomePageSelected(),
    ChatPage(),
    AboutPage()
  ];

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(100, 0, 0, 1),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: GNav(
            selectedIndex: selectedIndex,
            onTabChange: navigateBottomBar,
            backgroundColor: Color.fromRGBO(100, 0, 0, 1),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 129, 20, 20),
            padding: EdgeInsets.all(15),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.chat,
                text: "Chat"
              ),
              GButton(
                icon: Icons.info,
                text: "About"
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout, color: Colors.white,))],
        backgroundColor: const Color.fromRGBO(100, 0, 0, 1),
        title: const Row(
          children: [
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text(
                  'Donut',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'Creattion-Demo',
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
          ],
        ),
      ),
      body: pages[selectedIndex]
    );
  }
}