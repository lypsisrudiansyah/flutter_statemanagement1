import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_statemanagement1/module/home/home_page.dart';

class HomeController extends State<HomePage> {
  int counter = 0;
  ValueNotifier<int> counter2 = ValueNotifier<int>(0);
  late Timer timer;
  bool loading = false;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {});

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  void updateCounter() {
    counter++;
    print('Counter: $counter');
    // & setState just rebuild UI / Widget Once as it is called
    setState(() {});
  }

  void updateConterObservable() {
    // & some people called this observable value, every time the value changed, it will rebuild the UI / Widget,
    // & if you write counter2.value++; 10 times, it will rebuild the UI / Widget 10 times
    counter2.value++;
  }

  void updateLoading() {
    loading = !loading;

    if (loading == true) {
      // timer 3 second, then change into false
      Timer(const Duration(seconds: 2), () {
        loading = false;
        setState(() {});
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context, this);
  }
}
