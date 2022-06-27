import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'file_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  final String title = "File Operations";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  String fileContent = "No Data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Reading and Writing File in Flutter",
          style: GoogleFonts.aBeeZee(
            fontSize: 24.0,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: textController,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                FileUtils.saveToFile(textController.text);
              },
              child: Text(
                "Save to File",
                style: GoogleFonts.aBeeZee(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                FileUtils.readFromFile().then((contents) {
                  setState(() {
                    fileContent = contents;
                  });
                });
              },
              child: Text(
                "Read from File",
                style: GoogleFonts.aBeeZee(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(fileContent),
          ],
        ),
      ),
    );
  }
}
