import 'package:flutter/material.dart';
import 'package:flutter_statemanagement1/module/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeController controller) {
    if (controller.loading == true) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );

      // timer 3 second then running a function
      
    }

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
                "SetState on counter : ${controller.counter}",
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
                  onPressed: () => controller.updateCounter(),
                  child: const Text("Update counter"),
                ),
              ),
              const Divider(),
              ValueListenableBuilder(
                valueListenable: controller.counter2,
                builder: (context, value, child) {
                  return Text(
                    "ObservableValue on counter2 : ${controller.counter2.value}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                child: ElevatedButton(
                  onPressed: () => controller.updateConterObservable(),
                  child: const Text("Update counter2"),
                ),
              ),
              const Divider(),
              Text(
                "Loading : ${controller.loading}",
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                child: ElevatedButton(
                  onPressed: () => controller.updateLoading(),
                  child: const Text("Update Loading"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HomePage> createState() => HomeController();
}
