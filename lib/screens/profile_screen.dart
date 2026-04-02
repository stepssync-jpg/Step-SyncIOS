import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../services/step_counter_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Profile'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<StepCounterProvider>(
            builder: (context, stepProvider, _) {
              final totalSteps = stepProvider.dailySteps;
              final dayActive = 15;
              final longestStreak = 7;

              return Column(
                children: [
                  // Profile Avatar
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          CupertinoColors.systemBlue,
                          CupertinoColors.systemCyan,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Icon(
                      CupertinoIcons.person_alt_circle_fill,
                      size: 60,
                      color: CupertinoColors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'StepSync User',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Fitness Enthusiast',
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Stats Cards
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey6,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Total Steps',
                              style: TextStyle(
                                fontSize: 12,
                                color:
                                    CupertinoColors.systemGrey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${totalSteps ~/ 1000}K',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color:
                                    CupertinoColors.systemBlue,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Days Active',
                              style: TextStyle(
                                fontSize: 12,
                                color:
                                    CupertinoColors.systemGrey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '$dayActive',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color:
                                    CupertinoColors.systemGreen,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Streak',
                              style: TextStyle(
                                fontSize: 12,
                                color:
                                    CupertinoColors.systemGrey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '$longestStreak 🔥',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors
                                    .systemOrange,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Achievements
                  const Text(
                    'Achievements',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
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
                            _buildAchievement(
                                '🏃', 'First Steps', true),
                            _buildAchievement(
                                '⭐', '10K Steps', true),
                            _buildAchievement(
                                '🎯', 'Goal Master',
                                totalSteps >= stepProvider.dailyGoal),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: [
                            _buildAchievement(
                                '🔥', '7-Day Streak',
                                longestStreak >= 7),
                            _buildAchievement(
                                '💪', 'Marathon', false),
                            _buildAchievement(
                                '🏆', 'Champion', false),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Action Buttons
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: CupertinoColors.systemBlue,
                      onPressed: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) =>
                              CupertinoAlertDialog(
                            title: const Text('Share'),
                            content: const Text(
                                'Share your progress on social media'),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('Cancel'),
                                onPressed: () =>
                                    Navigator.pop(context),
                              ),
                              CupertinoDialogAction(
                                child: const Text('Share'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('Share Progress'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      onPressed: () {},
                      child: const Text('Export Data'),
                    ),
                  ),
                  const SizedBox(height: 24),
                ];
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAchievement(
      String emoji, String title, bool unlocked) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: unlocked
                ? CupertinoColors.systemGreen
                : CupertinoColors.systemGrey5,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 32),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: unlocked
                ? CupertinoColors.systemGreen
                : CupertinoColors.systemGrey,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
