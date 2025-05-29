import "package:flutter/material.dart";
import "screens/home_screen.dart";
import "screens/practice_screen.dart";
import "screens/leaderboard_screen.dart";
import "screens/profile_screen.dart";

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  MainScaffoldState createState() => MainScaffoldState();
}

class MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [HomeScreen(), PracticeScreen(), LeaderboardScreen(), ProfileScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.extension), label: "Practice"),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: "Leaderboard"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
