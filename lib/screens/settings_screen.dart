import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../services/step_counter_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _goalController;
  bool _notifications = true;
  bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    _goalController = TextEditingController();
  }

  @override
  void dispose() {
    _goalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CupertinoFormSection.insetGrouped(
                header: const Text('Daily Goal'),
                children: [
                  Consumer<StepCounterProvider>(
                    builder: (context, stepProvider, _) {
                      return CupertinoFormRow(
                        prefix: const Text('Daily Steps'),
                        child: CupertinoTextField(
                          placeholder: 'Enter goal',
                          keyboardType: TextInputType.number,
                          onSubmitted: (value) {
                            final goal = int.tryParse(value);
                            if (goal != null && goal > 0) {
                              stepProvider
                                  .updateGoal(goal);
                              showCupertinoDialog(
                                context: context,
                                builder: (context) =>
                                    CupertinoAlertDialog(
                                  title:
                                      const Text('Goal Updated'),
                                  content: Text(
                                      'Daily goal set to $goal steps'),
                                  actions: [
                                    CupertinoDialogAction(
                                      child:
                                          const Text('OK'),
                                      onPressed: () =>
                                          Navigator.pop(
                                              context),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CupertinoFormSection.insetGrouped(
                header: const Text('Notifications'),
                children: [
                  CupertinoFormRow(
                    prefix: const Text('Enable'),
                    child: CupertinoSwitch(
                      value: _notifications,
                      onChanged: (value) {
                        setState(() {
                          _notifications = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CupertinoFormSection.insetGrouped(
                header: const Text('Appearance'),
                children: [
                  CupertinoFormRow(
                    prefix: const Text('Dark Mode'),
                    child: CupertinoSwitch(
                      value: _darkMode,
                      onChanged: (value) {
                        setState(() {
                          _darkMode = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CupertinoFormSection.insetGrouped(
                header: const Text('About'),
                children: [
                  CupertinoFormRow(
                    prefix: const Text('App Version'),
                    child: const Text(
                      '1.0.0',
                      style: TextStyle(
                          color:
                              CupertinoColors.systemGrey),
                    ),
                  ),
                  CupertinoFormRow(
                    prefix: const Text('Build'),
                    child: const Text(
                      '1',
                      style: TextStyle(
                          color:
                              CupertinoColors.systemGrey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    color: CupertinoColors.systemRed,
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) =>
                            CupertinoAlertDialog(
                          title: const Text('Reset App'),
                          content: const Text(
                              'Are you sure? This cannot be undone.'),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text('Cancel'),
                              onPressed: () =>
                                  Navigator.pop(context),
                            ),
                            CupertinoDialogAction(
                              isDestructiveAction: true,
                              child: const Text('Reset'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Reset All Data'),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
