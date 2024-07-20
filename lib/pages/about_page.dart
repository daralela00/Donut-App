import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "About",
              style: TextStyle(
                fontSize: 75,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(100, 0, 0, 1)
              ),
            ),
          ),

          const SizedBox(height: 20),

           Container(
            padding: EdgeInsets.all(15),
             child: Align(
              alignment: Alignment.center,
              child: Text(
                "This project has been done by 1 studeont of University of Belgrade, Faculty of Mathematics.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(100, 0, 0, 1)
                ),
              ),
                       ),
           ),

           const SizedBox(height: 20),

            Container(
            padding: EdgeInsets.all(15),
             child: Align(
              alignment: Alignment.center,
              child: Text(
                "More about this and other projects can be found on next link:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(100, 0, 0, 1)
                ),
              ),
                       ),
           ),
           Container(
            padding: EdgeInsets.all(15),
             child: Align(
              alignment: Alignment.center,
              child: Text(
                "https://github.com/daralela00?tab=repositories",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(100, 0, 0, 1)
                ),
              ),
                       ),
           ),
        ],
      )
    );
  }
}