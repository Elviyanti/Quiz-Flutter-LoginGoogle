import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/signin_screen.dart'; // Pastikan ini diimpor
import 'services/auth_service.dart'; // Pastikan ini diimpor
import 'utils/theme_provider.dart';
import 'screens/user_info_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCNQExpmZLNgZxPnad9cbNhstWnCWwzBSc",
      authDomain: "quiz-e9c65.firebaseapp.com",
      projectId: "quiz-e9c65",
      storageBucket: "quiz-e9c65.firebasestorage.app",
      messagingSenderId: "605143010599",
      appId: "1:605143010599:web:2dfe48ab84e43e91c1ad02",
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return MaterialApp(
      title: 'Flutter Auth Demo',
      theme: themeProvider.themeData,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    // Tambahkan delay untuk splash screen
    await Future.delayed(const Duration(seconds: 2));
    
    final authService = Provider.of<AuthService>(context, listen: false);
    final user = authService.getCurrentUser();
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => user == null ? const SignInScreen() : const UserInfoScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 100),
            const SizedBox(height: 20),
            Text(
              'Selamat Datang',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}