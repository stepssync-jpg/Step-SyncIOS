import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'step_counter.dart';
import '../models/step_data.dart';

class StepCounterProvider extends ChangeNotifier {
  late StepCounterService _service;

  StepCounterProvider() {
    _service = StepCounterService();
  }

  StepCounterService get service => _service;

  int get dailySteps => _service.dailySteps;
  int get dailyGoal => _service.dailyGoal;
  List<StepData> get weeklyData => _service.weeklyData;
  double get todayProgress => _service.todayProgress;

  void addSteps(int steps) {
    _service.addSteps(steps);
    notifyListeners();
  }

  void updateGoal(int newGoal) {
    _service.updateGoal(newGoal);
    notifyListeners();
  }

  void resetDaily() {
    _service.resetDaily();
    notifyListeners();
  }
}
