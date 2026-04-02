class StepData {
  final DateTime date;
  final int steps;
  final int goal;
  final int calories;
  final double distance;

  StepData({
    required this.date,
    required this.steps,
    required this.goal,
    required this.calories,
    required this.distance,
  });

  double get progress => steps / goal;
  bool get goalReached => steps >= goal;
}

class UserStats {
  final int totalSteps;
  final int totalDistance;
  final int totalCalories;
  final int daysActive;
  final int longestStreak;
  final double averageStepsPerDay;

  UserStats({
    required this.totalSteps,
    required this.totalDistance,
    required this.totalCalories,
    required this.daysActive,
    required this.longestStreak,
    required this.averageStepsPerDay,
  });
}
