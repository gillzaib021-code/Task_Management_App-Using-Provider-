import 'package:flutter/material.dart';
import 'package:task_management_app_provider/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 3 seconds baad home screen par janay ke liye
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold add karne se yellow error lines khatam ho jayengi
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/task_magng.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Upar wala space cover karne ke liye taake loading niche aaye
            const Spacer(flex: 12),

            // Loading Bar
            Container(
              width: 250, // Bar ki lambai
              height: 8,   // Bar ki motai
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const LinearProgressIndicator(
                  value: 0.7, // 70% progress dikhane ke liye
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 13, 40, 61),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Loading Text
            const Text(
              "Loading...",
              style: TextStyle(
                color: Color.fromARGB(255, 13, 40, 61),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // Circular Spinner
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 13, 40, 61),
                ),
              ),
            ),

            // Niche thora sa gap rakhne ke liye
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}