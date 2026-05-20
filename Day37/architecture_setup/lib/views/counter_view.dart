import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {

  final CounterController controller = CounterController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("MVC Counter App"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Text(
              "Counter Value",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "${controller.counterValue}",
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),

            const SizedBox(height: 40),

            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                ElevatedButton(

                  onPressed: () {

                    setState(() {
                      controller.decrement();
                    });

                  },

                  child: const Icon(Icons.remove),
                ),

                const SizedBox(width: 20),

                ElevatedButton(

                  onPressed: () {

                    setState(() {
                      controller.reset();
                    });

                  },

                  child: const Text("Reset"),
                ),

                const SizedBox(width: 20),

                ElevatedButton(

                  onPressed: () {

                    setState(() {
                      controller.increment();
                    });

                  },

                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}