import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../services/step_counter_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('StepSync'),
      ),
      child: SafeArea(
        child: Consumer<StepCounterProvider>(
          builder: (context, stepProvider, child) {
            final progress = stepProvider.todayProgress;
            final displayProgress =
                progress > 1.0 ? 1.0 : progress;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Progress Circle
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator(
                          value: displayProgress,
                          strokeWidth: 8,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            displayProgress >= 1.0
                                ? CupertinoColors.systemGreen
                                : CupertinoColors.systemBlue,
                          ),
                          backgroundColor:
                              CupertinoColors.systemGrey5,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${stepProvider.dailySteps}',
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.systemBlue,
                            ),
                          ),
                          const Text(
                            'steps today',
                            style: TextStyle(
                              fontSize: 14,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Quick Stats
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey6,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Goal',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        CupertinoColors.systemGrey,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${stepProvider.dailyGoal}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Distance',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        CupertinoColors.systemGrey,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${(stepProvider.dailySteps * 0.0007).toStringAsFixed(1)} km',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Calories',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        CupertinoColors.systemGrey,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${(stepProvider.dailySteps * 0.04).toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Quick Add Buttons
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoButton(
                          color: CupertinoColors.systemBlue,
                          onPressed: () =>
                              stepProvider.addSteps(1000),
                          child: const Text('+ 1000'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CupertinoButton(
                          color: CupertinoColors.systemGreen,
                          onPressed: () =>
                              stepProvider.addSteps(5000),
                          child: const Text('+ 5000'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: CupertinoColors.systemOrange,
                      onPressed: () => stepProvider.resetDaily(),
                      child: const Text('Reset'),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Weekly Chart
                  const Text(
                    'This Week',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          stepProvider.weeklyData.length,
                      itemBuilder: (context, index) {
                        final data =
                            stepProvider.weeklyData[index];
                        final dayLabel =
                            ['Mon', 'Tue', 'Wed', 'Thu',
                              'Fri', 'Sat', 'Sun'][index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 35,
                                height: data.progress > 1.0
                                    ? 100
                                    : 100 *
                                        data.progress,
                                decoration: BoxDecoration(
                                  color: data.goalReached
                                      ? CupertinoColors
                                          .systemGreen
                                      : CupertinoColors
                                          .systemBlue,
                                  borderRadius:
                                      BorderRadius.circular(
                                          4),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                dayLabel,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: CupertinoColors
                                      .systemGrey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
