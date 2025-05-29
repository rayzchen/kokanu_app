import "package:flutter/material.dart";

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(child: Icon(Icons.person)),
        Column(
          children: [
            Text("XP: 1200"),
            Text("🔥 Streak: 4"),
          ],
        ),
        Icon(Icons.settings),
      ],
    );
  }
}
