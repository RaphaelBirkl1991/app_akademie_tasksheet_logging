import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Logger
  var logger = Logger(
    filter: null,
    printer: PrettyPrinter(),
    output: null,
  );

  List<String> logList = ["this", "is", "the", "amazing", "loglist"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // print
              OutlinedButton(
                  onPressed: () {
                    print("Print-Button fired!");
                  },
                  child: const Text("print")),
              const SizedBox(height: 20),

              // debug print
              OutlinedButton(
                  onPressed: () {
                    debugPrint("DebugPrint-Button fired!");
                  },
                  child: const Text("debug print")),
              const SizedBox(height: 20),

              // developer-log
              OutlinedButton(
                  onPressed: () {
                    log("DeveloperLog-Button fired!");
                  },
                  child: const Text("developer log")),
              const SizedBox(height: 20),

              // log
              OutlinedButton(
                  onPressed: () {
                    logger.i("logging info text...");
                  },
                  child: const Text("pretty-log")),

              const SizedBox(height: 20),

              OutlinedButton(
                  onPressed: () {
                    logger.e("error log", error: "Test Error");
                  },
                  child: const Text("Log an error")),

              const SizedBox(height: 20),

              OutlinedButton(
                  onPressed: () {
                    logWarningWithList(logList);
                  },
                  child: const Text("Log a warning"))
            ],
          ),
        ),
      ),
    );
  }

  void logWarningWithList(List<String> logList) {
    logger.w(logList);
  }
}
