import 'package:flutter/material.dart';
import 'package:wa_mobile/MainPage/loginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const LoginPageWidget()), // Replace SecondScreen with the screen you want to navigate to
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'lib/assets/wa_logo_icon.png',
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'lib/assets/wa_logo_text.png',
                width: 200,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(1.0),
              child: Align(
                child: Text(
                  'by Kryterion',
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    color: Color(0xFF616161),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
