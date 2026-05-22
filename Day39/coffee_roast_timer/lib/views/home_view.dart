import 'package:flutter/material.dart';
import '../controllers/roast_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final RoastController controller = RoastController();

  @override
  void dispose() {

    controller.stopRoasting();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xff121212),

      appBar: AppBar(
        title: const Text("Coffee Roast Timer"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),

      body: Center(

        child: ListenableBuilder(

          listenable: controller,

          builder: (context, child) {

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                AnimatedContainer(

                  duration: const Duration(milliseconds: 500),

                  width: 220,
                  height: 220,

                  decoration: BoxDecoration(
                    color: controller.roastColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: controller.roastColor.withOpacity(0.5),
                        blurRadius: 25,
                        spreadRadius: 5,
                      ),
                    ],
                  ),

                  child: const Center(
                    child: Icon(
                      Icons.coffee,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                Text(
                  "${controller.seconds} Seconds",
                  style: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  controller.roastStage,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange,
                  ),
                ),

                const SizedBox(height: 40),

                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  alignment: WrapAlignment.center,

                  children: [

                    ElevatedButton.icon(

                      onPressed: controller.startRoasting,

                      icon: const Icon(Icons.play_arrow),

                      label: const Text("Start"),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 15,
                        ),
                      ),
                    ),

                    ElevatedButton.icon(

                      onPressed: controller.backward,

                      icon: const Icon(Icons.skip_previous),

                      label: const Text("Back"),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 15,
                        ),
                      ),
                    ),

                    ElevatedButton.icon(

                      onPressed: controller.forward,

                      icon: const Icon(Icons.skip_next),

                      label: const Text("Forward"),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 15,
                        ),
                      ),
                    ),

                    ElevatedButton.icon(

                      onPressed: controller.reset,

                      icon: const Icon(Icons.refresh),

                      label: const Text("Reset"),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 15,
                        ),
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 35),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "MVC Architecture:\n"
                    "Controller handles roasting logic.\n"
                    "View updates automatically using ListenableBuilder.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}