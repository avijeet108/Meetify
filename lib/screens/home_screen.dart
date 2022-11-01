import 'package:flutter/material.dart';
import 'package:meetify/resources/auth_methods.dart';
import 'package:meetify/screens/history_meeting_screen.dart';
import 'package:meetify/screens/meeting_screen.dart';
import 'package:meetify/utils/colors.dart';
import 'package:meetify/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  onLogOut() async {
    AuthMethods().signOut();
    Navigator.pushNamed(context, '/login');
  }

  int _Page = 0;
  onPageChanged(int Page) {
    setState(() {
      _Page = Page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text('Help Center'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Meetify'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: onLogOut,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Icon(
                  Icons.logout_outlined,
                  color: buttonColor,
                )),
          )
        ],
      ),
      body: pages[_Page],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: buttonColor,
          unselectedItemColor: Colors.white,
          onTap: onPageChanged,
          currentIndex: _Page,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock),
              label: 'Meetings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline),
              label: 'Help',
            ),
          ]),
    );
  }
}
