import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donut_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgot_pw_page.dart';

class LoginPage extends StatefulWidget{
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //textFeild
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user function
  void signUserIn() async {

    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    // await FirebaseAuth.instance.signInWithEmailAndPassword(
    //   email: emailController.text,
    //   password: passwordController.text,
    // );
    // ...

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
      );

      firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
            "uid": userCredential.user!.uid,
            "email": emailController.text
          }
        );

      Navigator.pop(context);
    } on FirebaseAuthException catch (e){
      Navigator.pop(context);

      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(100, 0, 0, 1),
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          )
        );
      },
    );
  }

    


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(100, 0, 0, 1),
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
          
              // signup container part          
              FractionallySizedBox(
                widthFactor: 0.9,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: 240,
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

                      // Password textField
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Color.fromRGBO(100, 0, 0, 0.3)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(100, 0, 0, 1))
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(100, 0, 0, 1))
                          )
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Forgot password part
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap:() {
                              Navigator.push(context, MaterialPageRoute(builder:(context) {
                                return const ForgotPasswordPage();
                              },),);
                            },
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(color: Color.fromRGBO(100, 0, 0, 1), fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Button sign in
                      GestureDetector(
                        onTap: signUserIn,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(100, 0, 0, 1),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: const Center(
                            child: Text(
                              'Sign in',
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

              const SizedBox(height: 20),

              // or continue with part
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                    ),
                
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),
                            
              // google button part
              GestureDetector(
                onTap: () =>  AuthService().signInWithGoogle(),
                child: Image.asset(
                    'lib/images/google.png',
                    height: 65,
                  ),
              ),

              const SizedBox(height: 30),
          
              // no accout? register now part
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'New user?',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(width: 5),

                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}