import "package:flutter/material.dart";
import "package:speech_to_text/speech_to_text.dart";

class SpeechToTextPage extends StatefulWidget {
  const SpeechToTextPage({super.key});

  @override
  State<SpeechToTextPage> createState() => _SpeechToTextPageState();
}

class _SpeechToTextPageState extends State<SpeechToTextPage> {

  final SpeechToText speechToText = SpeechToText();

  bool speechEnabled = false;
  String wordsSpoken = "";
  double confidenceLevel = 0;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    speechEnabled = await speechToText.initialize();
    setState(() {});
  }

  void startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  void stopListening() async {
    await speechToText.stop();
    setState(() {
      confidenceLevel = 0;
    });
  }

  void onSpeechResult(result) {
    setState(() {
      wordsSpoken = "${result.recognizedWords}";
      confidenceLevel = result.confidence;
    });
  }

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
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                speechToText.isListening ? "Listening..." : speechEnabled ? "Tap the microphone to start listening..." : "Speech not available",
                style: const TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  wordsSpoken,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
            ),
            if (speechToText.isNotListening && confidenceLevel >= 0) Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Text(
                "Confidence: ${(confidenceLevel * 100).toStringAsFixed(1)}%",
                style:  const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w200,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: speechToText.isListening ? stopListening : startListening,
        tooltip: "Listen",
        backgroundColor: const Color.fromRGBO(100, 0, 0, 1),
        child: Icon(
          speechToText.isNotListening ? Icons.mic_off : Icons.mic,
          color: Colors.white,
        ),
      ),
    );
  }
}