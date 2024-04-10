import 'package:flutter/material.dart';

void main() {
  runApp(const MainPageFirstWidget());
}

class MainPageFirstWidget extends StatelessWidget {
  const MainPageFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF616161),
                ), // Adjust font size as needed
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Navigate to profile page
                // Navigator.pushNamed(context, '/profile'); //this one will fail.
              },
              icon: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color(0xFF675DC2), width: 2), // Add stroke
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage(
                      'lib/assets/avatar_person.png'), // Add your avatar image
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0), // Set your desired padding here
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'lib/assets/unregistered_icon.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 5),
                const Text(
                  "You don't have any upcoming exam",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 20),
                const Text(
                  "By clicking the button below, you will be redirected to the official website of Webassessor.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF616161), fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF675DC2)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(230, 50)),
                  ),
                  child: const Text("Register for exam now"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
