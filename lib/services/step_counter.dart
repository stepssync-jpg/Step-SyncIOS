import 'package:flutter/cupertino.dart';
import '../models/step_data.dart';

class StepCounterService extends ChangeNotifier {
  int _dailySteps = 8432;
  int _dailyGoal = 10000;
  List<StepData> _weeklyData = [];

  StepCounterService() {
    _initializeWeeklyData();
  }

  void _initializeWeeklyData() {
    final today = DateTime.now();
    for (int i = 6; i >= 0; i--) {
      final date = today.subtract(Duration(days: i));
      _weeklyData.add(
        StepData(
          date: date,
          steps: (6000 + (i * 1500)).toInt(),
          goal: _dailyGoal,
          calories: ((6000 + (i * 1500)) * 0.04).toInt(),
          distance: ((6000 + (i * 1500)) * 0.0007),
        ),
      );
    }
  }

  int get dailySteps => _dailySteps;
  int get dailyGoal => _dailyGoal;
  List<StepData> get weeklyData => _weeklyData;
  double get todayProgress => _dailySteps / _dailyGoal;

  void addSteps(int steps) {
    _dailySteps += steps;
    notifyListeners();
  }

  void updateGoal(int newGoal) {
    _dailyGoal = newGoal;
    notifyListeners();
  }

  void resetDaily() {
    _dailySteps = 0;
    notifyListeners();
  }
}
