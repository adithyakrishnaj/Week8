import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final CounterController controller = CounterController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xfff4f7fb),

      appBar: AppBar(
        title: const Text("Task Manager"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),

      body: Center(

        child: Container(

          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(25),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                blurRadius: 12,
                color: Colors.black12,
                offset: Offset(0, 5),
              )
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [

              const Icon(
                Icons.task_alt,
                size: 80,
                color: Colors.indigo,
              ),

              const SizedBox(height: 20),

              const Text(
                "Completed Tasks",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              Text(
                "${controller.count}",
                style: const TextStyle(
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),

              const SizedBox(height: 35),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  FloatingActionButton(
                    heroTag: "minus",
                    backgroundColor: Colors.red,
                    onPressed: () {

                      setState(() {
                        controller.decrement();
                      });

                    },
                    child: const Icon(Icons.remove),
                  ),

                  const SizedBox(width: 20),

                  FloatingActionButton(
                    heroTag: "reset",
                    backgroundColor: Colors.orange,
                    onPressed: () {

                      setState(() {
                        controller.reset();
                      });

                    },
                    child: const Icon(Icons.refresh),
                  ),

                  const SizedBox(width: 20),

                  FloatingActionButton(
                    heroTag: "plus",
                    backgroundColor: Colors.green,
                    onPressed: () {

                      setState(() {
                        controller.increment();
                      });

                    },
                    child: const Icon(Icons.add),
                  ),

                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "MVC Pattern:\nView only calls controller methods.\nAll business logic stays inside Controller.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}