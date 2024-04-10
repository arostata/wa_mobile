import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:wa_mobile/Launcher/notification_page.dart';
import 'package:wa_mobile/Profile/EditProfile.dart';
import 'package:wa_mobile/ReviewerPage/reviewer_page.dart';
import 'package:wa_mobile/model/AssessmentDetailsModel.dart';
import 'package:wa_mobile/model/UserModel.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondPage extends StatefulWidget {
  final UserModel user;
  final List<AssessmentDetailsModel> examList;
  const SecondPage({Key? key, required this.user, required this.examList})
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
    Future<void> _launchUrl() async {
      final Uri _url =
          Uri.parse('https://www.webassessor.com/wa.do?page=defaultLogin');
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    String parseDateString(String originalString) {
      List<String> parts = originalString.split(' ');

      String dateString = parts.sublist(0, 3).join(' ');
      DateTime date = DateFormat('d MMMM yyyy').parse(dateString);

      String timeString = parts[3].substring(0, parts[3].length - 1);
      int hour = int.parse(timeString.substring(0, 2));
      int minute = int.parse(timeString.substring(2));

      DateTime time = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, hour, minute);

      String formattedDate = DateFormat('MMMM d, yyyy').format(date);
      String formattedTime = DateFormat('h:mm a').format(time);

      return '$formattedDate | $formattedTime (MST)';
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(103, 93, 194, 0.9)),
              ),
              Text(
                'Bruce Wayne',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(103, 93, 194, 1)),
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
          bottom: const TabBar(
            tabs: <Tab>[
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.calendar_month), text: 'Scheduled'),
              Tab(icon: Icon(Icons.lock_clock), text: 'In Progress'),
              Tab(icon: Icon(Icons.done), text: 'Completed'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Upcoming Exam',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        _buildExamCard(
                          title: widget.examList[0].examTitle,
                          dateTime:
                              parseDateString(widget.examList[0].examSched),
                          subtitle: widget.examList[0].examType,
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
                          color: Color.fromRGBO(103, 93, 194, 0.08),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Later',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        _buildExamCard(
                          title: widget.examList[1].examTitle,
                          dateTime:
                              parseDateString(widget.examList[1].examSched),
                          subtitle: widget.examList[1].examType,
                          onPressed: () {
                            // Handle button press
                          },
                          buttonText: 'Review',
                          isElevatedButton: false,
                        ),
                        _buildExamCard(
                          title: widget.examList[2].examTitle,
                          dateTime:
                              parseDateString(widget.examList[2].examSched),
                          subtitle: widget.examList[2].examType,
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
                ],
              ),
            ),
            const Center(
                child: Text('All scheduled assesments will appear here...')),
            Center(
                child: Text('All in-progress assesments will appear here...')),
            Center(child: Text('All completed assesments will appear here...')),
          ],
        ),
        bottomNavigationBar: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0), // Adjust the padding as needed
            child: ElevatedButton(
              onPressed: _launchUrl,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF675DC2)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                minimumSize: MaterialStateProperty.all<Size>(
                    const Size(double.infinity, 50)),
              ),
              child: const Text(
                'Register another exam',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
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
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              dateTime,
              style: const TextStyle(
                fontSize: 14,
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
