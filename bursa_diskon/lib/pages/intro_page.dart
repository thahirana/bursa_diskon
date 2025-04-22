import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.only(
              left: 80.0, right: 80, bottom: 40, top: 160),
            child: Image.asset('lib/images/logo.png', height: 200,),
          ),

          // title
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Welcome to Bursa Diskon",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // category
          Text(
            "What do you want to buy?",
            style: TextStyle(color: Colors.grey[600]),
          ),

          const Spacer(),

          // get started button
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context, 
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text(
                "Get started", 
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}