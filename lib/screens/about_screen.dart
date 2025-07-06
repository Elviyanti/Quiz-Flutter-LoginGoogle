import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/theme_provider.dart';
import '../widgets/custome_bottom_nav.dart';
import 'user_info_screen.dart';
import 'signin_screen.dart';
import '../services/auth_service.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('About App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Firebase Auth Demo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'This is a simple demo application showing Firebase Authentication with Google Sign-In in Flutter.',
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Dark Mode'),
                const Spacer(),
                Switch(
                  value: themeProvider.isDark,
                  onChanged: (value) => themeProvider.toggleTheme(),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const UserInfoScreen()),
            );
          } else if (index == 2) {
            final authService = Provider.of<AuthService>(context, listen: false);
            authService.signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignInScreen()),
            );
          }
        },
      ),
    );
  }
}