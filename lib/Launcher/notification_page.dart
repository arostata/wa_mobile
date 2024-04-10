import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Future<void> _requestPermissions() async {
    PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      // Notification permission granted
      // exit the app here.
      Navigator.pop(context);
    } else if (status.isDenied) {
      // Notification permission denied
      // exit the app here.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.all(18.0), // Adjust the padding as needed
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'lib/assets/notif_logo.svg',
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Turn on notification for Webassesor?",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Don't miss important messages like upcoming exams and account activity.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF616161), fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0), // Add padding to the buttons
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _requestPermissions,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF675DC2)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 50)),
                  ),
                  child: const Text("Enabled Notification"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF675DC2)),
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 50)),
                  ),
                  child: const Text("Skip"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
