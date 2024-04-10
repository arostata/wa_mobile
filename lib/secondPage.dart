import 'package:flutter/material.dart';
import 'package:wa_mobile/Launcher/notification_page.dart';
import 'package:wa_mobile/Profile/EditProfile.dart';
import 'package:wa_mobile/ReviewerPage/reviewer_page.dart';
import 'package:wa_mobile/model/AssessmentDetailsModel.dart';
import 'package:wa_mobile/model/UserModel.dart';
import 'package:permission_handler/permission_handler.dart';

class SecondPage extends StatefulWidget {
  final UserModel user;

  const SecondPage(
      {Key? key,
      required this.user,
      required List<AssessmentDetailsModel> assessmentsList})
      : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
    _checkNotificationPermission();
  }

  Future<void> _checkNotificationPermission() async {
    await Future.delayed(const Duration(seconds: 2));
    PermissionStatus status = await Permission.notification.status;
    if (status.isDenied) {
      /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotificationPage()),
      );*/
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const NotificationPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    }
  }

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
              ),
            ),
            Text(
              'April 10, 2024 | 2:30 PM | PHST (UTC +8)',
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
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      EditProfile(user: widget.user),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = Offset(1.0, 0.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            },
            icon: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF675DC2),
                  width: 2,
                ),
              ),
              child: const CircleAvatar(
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
                    dateTime: 'April 10, 2024 | 2:30 PM | PHST (UTC +8)',
                    onPressed: () {
                      // Handle button press
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReviewerPage()),
                      );
                    },
                    buttonText: 'Review Now',
                    isElevatedButton: true,
                  ),
                  const Divider(
                    color: Color(0xFFD9D9D9),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
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
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF675DC2)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50)),
                ),
                child: const Text(
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
      margin: const EdgeInsets.all(8),
      color: const Color.fromRGBO(103, 93, 194, 0.05),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              dateTime,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF616161),
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
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
                      backgroundColor: const Color(0xFF675DC2),
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                if (!isElevatedButton)
                  TextButton(
                    onPressed: onPressed,
                    child: Text(
                      buttonText,
                      style: const TextStyle(
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
