import "package:flutter/material.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          SizedBox(height: 10),
          Text("Username", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("XP: 1234 | Streak: 5 🔥")
        ],
      ),
    );
  }
}