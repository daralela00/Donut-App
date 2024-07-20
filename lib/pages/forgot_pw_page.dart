import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Color.fromRGBO(100, 0, 0, 1),
            content: Text("Reset link has been sent", style: TextStyle(color: Colors.white)),
          );
        },
      );
    } on FirebaseAuthException catch(e){
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromRGBO(100, 0, 0, 1),
            content: Text(e.message.toString(), style: const TextStyle(color: Colors.white)),
          );
        },
      ); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(100, 0, 0, 1),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        backgroundColor: const Color.fromRGBO(100, 0, 0, 1),
        elevation: 0,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
          
              // logo part      
              Image.asset('lib/images/donutPic.webp', height: 100),

              const Padding(
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

              const SizedBox(height: 10),

              FractionallySizedBox(
                widthFactor: 0.9,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      // Email textField
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Color.fromRGBO(100, 0, 0, 0.3)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(100, 0, 0, 1))
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(100, 0, 0, 1))
                          )
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Button rest password
                      GestureDetector(
                        onTap: passwordReset,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(100, 0, 0, 1),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: const Center(
                            child: Text(
                              'Reset password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}