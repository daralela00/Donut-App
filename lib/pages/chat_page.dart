import 'package:donut_app/pages/chat_gpt_page.dart';
import 'package:donut_app/pages/chat_users_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),

                Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Hi, ${user.email!}.',
                  style: const TextStyle(
                    color: Color.fromRGBO(100, 0, 0, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

                const SizedBox(height: 25),

                //ChatHuman button
                FractionallySizedBox(
                  widthFactor: 0.95,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                                return ChatUsersPage();
                              },),);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: const Row(
                      
                        children: [
                          Icon(
                            Icons.forum,
                            color: Color.fromRGBO(100, 0, 0, 1),
                          ),
                      
                          SizedBox(width: 15),
                      
                          Text(
                            "Chat",
                            style: TextStyle(color: Color.fromRGBO(100, 0, 0, 1), fontWeight: FontWeight.bold),
                          ),
                      
                          Expanded(child: SizedBox()),
                      
                          Icon(Icons.chevron_right, color: Color.fromRGBO(100, 0, 0, 1))
                      
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                //ChatGPT button
                FractionallySizedBox(
                  widthFactor: 0.95,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                                return const ChatGptPage();
                              },),);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: const Row(
                      
                        children: [
                          Icon(
                            Icons.smart_toy,
                            color: Color.fromRGBO(100, 0, 0, 1),
                          ),
                      
                          SizedBox(width: 15),
                      
                          Text(
                            "ChatGPT",
                            style: TextStyle(color: Color.fromRGBO(100, 0, 0, 1), fontWeight: FontWeight.bold),
                          ),
                      
                          Expanded(child: SizedBox()),
                      
                          Icon(Icons.chevron_right, color: Color.fromRGBO(100, 0, 0, 1))
                      
                        ],
                      ),
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