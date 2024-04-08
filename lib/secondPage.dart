import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Upcoming Exam',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ), // Adjust font size as needed
            ),
            Text(
              'April 10, 2024 | 2:30 PM | PHST (UTC +8)',
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
              Navigator.pushNamed(context, '/profile');
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
        padding: const EdgeInsets.all(8.0), // Add padding to all sides
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Card(
                    elevation: 0, // Remove shadow
                    margin: const EdgeInsets.all(8), // Add margin for spacing
                    color: const Color.fromRGBO(
                        103, 93, 194, 0.05), // Background color with 5% opacity
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'The title or label of exam',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Online Proctor',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF616161), // Change text color
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Handle button press
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(
                                      0xFF675DC2), // Background color
                                ),
                                child: const Text(
                                  'Review Now',
                                  style: TextStyle(
                                      color: Colors.white), // Text color
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Color(0xFFD9D9D9), // Set divider color
                  ), // Separator Line
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Later',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Card(
                    elevation: 0, // Remove shadow
                    margin: const EdgeInsets.all(8), // Add margin for spacing
                    color: const Color.fromRGBO(
                        103, 93, 194, 0.05), // Background color with 5% opacity
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'The title or label of exam',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'May 5, 2024 | 4:00 PM | PHST (UTC +8)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF616161), // Change text color
                            ),
                          ),
                          const Text(
                            'Online Proctor',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF616161), // Change text color
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Handle button press
                                },
                                child: const Text(
                                  'Review',
                                  style: TextStyle(
                                    color: Color(0xFF675DC2), // Text color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0, // Remove shadow
                    margin: const EdgeInsets.all(8), // Add margin for spacing
                    color: const Color.fromRGBO(
                        103, 93, 194, 0.05), // Background color with 5% opacity
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'The title or label of exam',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'May 5, 2024 | 4:00 PM | PHST (UTC +8)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF616161), // Change text color
                            ),
                          ),
                          const Text(
                            'Online Proctor',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF616161), // Change text color
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Handle button press
                                },
                                child: const Text(
                                  'Review',
                                  style: TextStyle(
                                    color: Color(0xFF675DC2), // Text color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Add more CardViews as needed
                ],
              ),
            ),
            SizedBox(
              // Add SizedBox to ensure proper spacing
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF675DC2), // Background color
                ),
                child: const Text(
                  'Register another exam',
                  style: TextStyle(color: Colors.white), // Text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
