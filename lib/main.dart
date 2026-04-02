import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'services/step_counter_provider.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StepCounterProvider(),
        ),
      ],
      child: CupertinoApp(
        title: 'StepSync',
        theme: const CupertinoThemeData(
          primaryColor: CupertinoColors.systemBlue,
          brightness: Brightness.light,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const HomeScreen();
          case 1:
            return const SettingsScreen();
          case 2:
            return const ProfileScreen();
          default:
            return const HomeScreen();
        }
      },
    );
  }
}
