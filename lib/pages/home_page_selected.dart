import 'package:donut_app/pages/speech_to_text_page.dart';
import 'package:donut_app/pages/to_do_notes_page.dart';
import 'package:donut_app/pages/weather_app_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageSelected extends StatefulWidget {
  const HomePageSelected({super.key});

  @override
  State<HomePageSelected> createState() => _HomePageSelectedState();
}

class _HomePageSelectedState extends State<HomePageSelected> {

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                //Weather app button
                FractionallySizedBox(
                  widthFactor: 0.95,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                                return const WeatherAppPage();
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
                            Icons.thermostat,
                            color: Color.fromRGBO(100, 0, 0, 1),
                          ),
                      
                          SizedBox(width: 15),
                      
                          Text(
                            "Weather",
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

                //To Do Notes app
                FractionallySizedBox(
                  widthFactor: 0.95,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                                return const ToDoNotesPage();
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
                            Icons.checklist,
                            color: Color.fromRGBO(100, 0, 0, 1),
                          ),
                      
                          SizedBox(width: 15),
                      
                          Text(
                            "To do notes ",
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

                //Speech to text button
                FractionallySizedBox(
                  widthFactor: 0.95,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                                return const SpeechToTextPage();
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
                            Icons.mic,
                            color: Color.fromRGBO(100, 0, 0, 1),
                          ),
                      
                          SizedBox(width: 15),
                      
                          Text(
                            "Speech to text",
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
      );
  }
}