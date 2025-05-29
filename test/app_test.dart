import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:kokanu/app.dart"; // Adjust the import path as necessary

void main() {
  testWidgets("Main app loads and navigates between tabs", (WidgetTester tester) async {
    await tester.pumpWidget(const KokanuApp());

    // Verify HomeScreen is loaded by checking for "Your Path" text
    expect(find.text("Your Path"), findsOneWidget);

    // Verify bottom navigation bar is present
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Tap Practice tab
    await tester.tap(find.text("Practice"));
    await tester.pumpAndSettle();
    expect(find.text("Practice coming soon!"), findsOneWidget);

    // Tap Leaderboard tab
    await tester.tap(find.text("Leaderboard"));
    await tester.pumpAndSettle();
    expect(find.text("Leaderboard coming soon!"), findsOneWidget);

    // Tap Profile tab
    await tester.tap(find.text("Profile"));
    await tester.pumpAndSettle();
    expect(find.text("Username"), findsOneWidget);

    // Tap Home tab to go back
    await tester.tap(find.text("Home"));
    await tester.pumpAndSettle();
    expect(find.text("Your Path"), findsOneWidget);
  });
}