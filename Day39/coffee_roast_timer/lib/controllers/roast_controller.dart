import 'dart:async';
import 'package:flutter/material.dart';

class RoastController extends ChangeNotifier {

  int seconds = 0;

  Timer? timer;

  String roastStage = "Green";

  Color roastColor = Colors.green;

  bool isRunning = false;

  void startRoasting() {

    if (isRunning) return;

    isRunning = true;

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {

        if (seconds >= 50) {

          stopRoasting();

        } else {

          seconds++;

          updateRoastStage();

        }

      },
    );

    notifyListeners();
  }

  void stopRoasting() {

    timer?.cancel();

    isRunning = false;

    notifyListeners();
  }

  void reset() {

    timer?.cancel();

    seconds = 0;

    isRunning = false;

    updateRoastStage();

    notifyListeners();
  }

  void forward() {

    if (seconds < 50) {

      seconds += 10;

      if (seconds > 50) {
        seconds = 50;
      }

      updateRoastStage();
    }

    notifyListeners();
  }

  void backward() {

    if (seconds > 0) {

      seconds -= 10;

      if (seconds < 0) {
        seconds = 0;
      }

      updateRoastStage();
    }

    notifyListeners();
  }

  void updateRoastStage() {

    if (seconds <= 20) {

      roastStage = "Green";
      roastColor = Colors.green;

    } else if (seconds <= 30) {

      roastStage = "Light Brown";
      roastColor = Colors.brown.shade300;

    } else if (seconds <= 40) {

      roastStage = "Brown";
      roastColor = Colors.brown;

    } else {

      roastStage = "Dark Brown";
      roastColor = const Color(0xff3E2723);

    }

    notifyListeners();
  }
}