import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image with rounded corners
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/images/welcome bg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black
                    .withOpacity(0.3), // Optional overlay for readability
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  const Text(
                    'We welcome you to\nInstaFeet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Register button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ).copyWith(
                          backgroundColor:
                              WidgetStateProperty.resolveWith<Color?>((states) {
                            return null;
                          }),
                          shadowColor:
                              WidgetStateProperty.all(Colors.transparent),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFEC008C), Color(0xFF00B5E2)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Log in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Company link
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Do you represent a company? ',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        children: [
                          TextSpan(
                            text: 'Start here',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            // Add gesture recognizer if you want it clickable
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
