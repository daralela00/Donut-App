import 'package:donut_app/components/user_tile.dart';
import 'package:donut_app/pages/private_chat_page.dart';
import 'package:donut_app/services/auth_service.dart';
import 'package:donut_app/services/chat_service.dart';
import 'package:flutter/material.dart';

class ChatUsersPage extends StatelessWidget {
  ChatUsersPage({super.key});

  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Row(
          children: [
              Padding(
                padding: EdgeInsets.only(left: 1),
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
        backgroundColor: const Color.fromRGBO(100, 0, 0, 1),
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
      ),
      body: buildUserList(),
    );
  }

  Widget buildUserList() {
    return StreamBuilder(
      stream: chatService.getUsersStream(),
      builder: (context, snapshot) {
        if(snapshot.hasError) {
          return const Text("Error");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        return ListView(
          children: snapshot.data!.map<Widget>((userData) => buildUserListItem(userData, context)).toList(),
        );
      },
    );
  }
}

Widget buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
  if (userData["email"] != AuthService().getCurrentUser()!.email) {
    return UserTile(
    text: userData["email"],
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PrivateChatPage(receiveEmail: userData["email"], receiverID: userData["uid"],),),);
    },
  );
  } else {
    return Container();
  }
}