import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/welcome.jpg',
                  fit: BoxFit.cover,
                ),
                Container(color: Colors.black.withOpacity(0.1)),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Start a new social adventure.',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFf2f2f2),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Ready to find your new Home?',
                    style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                    child: const Text("Sign in",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen())),
                    child: const Text("Create Account",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
