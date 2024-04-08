import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Upcoming Exam',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'April 10, 2024 | 2:30 PM | PHST (UTC +8)',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF616161),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to profile page
              // Navigator.pushNamed(context, '/profile');
            },
            icon: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFF675DC2),
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/assets/avatar_person.png'),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildExamCard(
                    title: 'The title or label of exam',
                    subtitle: 'Online Proctor',
                    dateTime: 'April 10, 2024 | 2:30 PM | PHST (UTC +8)',
                    onPressed: () {
                      // Handle button press
                    },
                    buttonText: 'Review Now',
                    isElevatedButton: true,
                  ),
                  Divider(
                    color: Color(0xFFD9D9D9),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Later',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildExamCard(
                    title: 'The title or label of exam',
                    subtitle: 'May 5, 2024 | 4:00 PM | PHST (UTC +8)',
                    dateTime: 'Online Proctor',
                    onPressed: () {
                      // Handle button press
                    },
                    buttonText: 'Review',
                    isElevatedButton: false,
                  ),
                  _buildExamCard(
                    title: 'The title or label of exam',
                    subtitle: 'May 5, 2024 | 4:00 PM | PHST (UTC +8)',
                    dateTime: 'Online Proctor',
                    onPressed: () {
                      // Handle button press
                    },
                    buttonText: 'Review',
                    isElevatedButton: false,
                  ),
                  // Add more CardViews as needed
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF675DC2),
                ),
                child: Text(
                  'Register another exam',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamCard({
    required String title,
    required String subtitle,
    required String dateTime,
    required VoidCallback onPressed,
    required String buttonText,
    required bool isElevatedButton,
  }) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(8),
      color: Color.fromRGBO(103, 93, 194, 0.05),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              dateTime,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF616161),
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF616161),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (isElevatedButton)
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF675DC2),
                    ),
                    child: Text(
                      buttonText,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                if (!isElevatedButton)
                  TextButton(
                    onPressed: onPressed,
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        color: Color(0xFF675DC2),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
