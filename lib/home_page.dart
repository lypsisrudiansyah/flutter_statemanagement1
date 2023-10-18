// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  ValueNotifier<int> counter2 = ValueNotifier<int>(0);
  late Timer timer;

  void updateCounter() {
    counter++;
    print('Counter: $counter');
    // & setState just rebuild UI / Widget Once as it is called
    setState(() {});
  }

  void updateConterObservable(params) {
    
  }

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) { });
    
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Management Practice"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              Text(
                counter.toString(),
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                child: ElevatedButton(
                  onPressed: () => updateCounter(),
                  child: const Text("Update Counter"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
