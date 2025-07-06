import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import 'user_info_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil AuthService dari Provider dengan listen: false karena tidak butuh rebuild
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  final user = await authService.signInWithGoogle();
                  if (user != null) {
                    // Berhasil login, navigasi ke UserInfoScreen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserInfoScreen(),
                      ),
                    );
                  } else {
                    // Gagal login atau dibatalkan
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sign-in was cancelled or failed.')),
                    );
                  }
                } catch (e) {
                  // Tampilkan error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Sign-in error: $e')),
                  );
                  print('Sign-in error: $e');
                }
              },
              child: const Text('Sign In with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
