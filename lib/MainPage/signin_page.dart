import 'dart:convert';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:wa_mobile/Launcher/notification_page.dart';
import 'package:wa_mobile/model/AssessmentDetailsModel.dart';
import 'package:wa_mobile/model/UserModel.dart';
import 'package:wa_mobile/secondPage.dart';

/* Sign in Page */
class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPage();
}

class _SigninPage extends State<SigninPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    // _checkNotificationPermission();
  }

  Future<void> _checkNotificationPermission() async {
    PermissionStatus status = await Permission.notification.status;
    if (status.isDenied) {
      /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotificationPage()),
      );*/
      /*Navigator.push(
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
      );*/
    }
  }

  /*Future<void> _signIn() async {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    final url = Uri.parse('https://local.webassessor.com/wa/profile/getCandidateDetails/7');
    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final user = UserModel(
        userid: responseData['userid'],
        username: responseData['username'],
        password: responseData['password'],
        firstName: responseData['firstName'],
        lastName: responseData['lastName'],
        email: responseData['email'],
        phone: responseData['phone'],
        fullAddress: responseData['fullAddress'],
        city: responseData['city'],
        province: responseData['province'],
        postalCode: responseData['postalCode'],
        country: responseData['country'],
      );

      // Navigate to next screen or perform any other action with user data
    } else {
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
    }
  }*/

  Future<void> _signIn(BuildContext context) async {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (username == 'candidate' && password == 'candidate') {
      final client = HttpClient()
        ..badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);

      final clientAssessment = HttpClient()
        ..badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);

      final url =
          Uri.parse('https://192.168.254.174/wa/profile/getCandidateDetails/7');
      final request = await client.getUrl(url);
      final response = await request.close();

      final urlAssessment = Uri.parse(
          'https://192.168.254.174/wa/assessments/getRegistrationsByUser/7/SCHEDULED');
      final requestAssessment = await clientAssessment.getUrl(urlAssessment);
      final responseAssessment = await requestAssessment.close();

      if (response.statusCode == HttpStatus.ok &&
          responseAssessment.statusCode == HttpStatus.ok) {
        final responseBody = await response.transform(utf8.decoder).join();
        final responseData = json.decode(responseBody);
        final user = UserModel(
          userid: responseData['id'],
          username: username,
          password: password,
          firstName: responseData['firstName'],
          lastName: responseData['lastName'],
          email: responseData['email'],
          phone: responseData['phoneNumber'],
          fullAddress: responseData['mailingAddress']['address1'],
          city: responseData['mailingAddress']['city'],
          province: responseData['mailingAddress']['province'],
          postalCode: responseData['mailingAddress']['postalCode'],
          country: responseData['mailingAddress']['country'],
        );
        print(responseData);

        final responseAssessmentBody =
            await responseAssessment.transform(utf8.decoder).join();

        // Parse JSON data
        List<Map<String, dynamic>> assessmentDataList =
            json.decode(responseAssessmentBody).cast<Map<String, dynamic>>();

        // Transfer JSON data to a list of Item objects
        List<AssessmentDetailsModel> assessmentsList = [];
        for (var jsonItem in assessmentDataList) {
          AssessmentDetailsModel assessment =
              AssessmentDetailsModel.fromJson(jsonItem);
          assessmentsList.add(assessment);
        }

        // Navigate to next screen or perform any other action with user data
        // Navigate to the SecondPage
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                SecondPage(user: user, examList: assessmentsList),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
      } else {
        setState(() {
          _errorMessage = "Something's not right";
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
    }
  }

  /*Future<void> _signIn(BuildContext context) async {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (username == 'candidate' && password == 'candidate') {
      final url =
          Uri.parse('http://10.80.222.157/wa/profile/getCandidateDetails/7');
      final response = await http.get(url);

      print("test coddeeeeeee");
      print(json.decode(response.body));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final user = UserModel(
          userid: responseData['id'],
          username: username,
          password: password,
          firstName: responseData['firstName'],
          lastName: responseData['lastName'],
          email: responseData['email'],
          phone: responseData['phoneNumber'],
          fullAddress: "responseData['fullAddress']",
          city: "responseData['city']",
          province: "responseData['province']",
          postalCode: "responseData['postalCode']",
          country: "responseData['country']",
        );

        // Navigate to next screen or perform any other action with user data
        // Navigate to the SecondPage
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                SecondPage(user: user),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
      } else {
        setState(() {
          _errorMessage = "Something's not right";
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '', // Empty Title Bar for the meantime...
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
      ),
      // Add resizeToAvoidBottomInset property to avoid keyboard overlapping.
      resizeToAvoidBottomInset: true,
      body: _buildLoginPage(context), // Build the login page UI
    );
  }

  Widget _buildLoginPage(BuildContext context) {
    final _formKey = GlobalKey<
        FormState>(); // This will be used to identify each key of input field in the form...
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 400,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      // Logo Section
                      const Image(
                        image: AssetImage('lib/assets/logo_test_2.png'),
                        width: 100,
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(height: 30),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Welcome to Webassessor",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Please sign in to your account",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Form Section...
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username or Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          prefixIcon: const Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username or email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      if (_errorMessage.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            _errorMessage,
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Forgot Password?'),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            /* if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              _signIn();
                            } */
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              // Show loading indicator
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );

                              // Call _signInAndNavigate after 2 seconds
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.pop(
                                    context); // Close loading indicator
                                _signIn(
                                    context); // Proceed with authentication and navigation
                              });
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF675DC2)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            minimumSize: MaterialStateProperty.all<Size>(
                                const Size(300, 50)),
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.0),
                        child: Row(children: <Widget>[
                          Expanded(child: Divider()),
                          Text(" Or sign in with ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 96, 96, 96))),
                          Expanded(child: Divider()),
                        ]),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.apple),
                            color: const Color.fromARGB(255, 59, 89, 152),
                            iconSize: 40.0,
                            onPressed: () {
                              // Make authenticated requests to Facebook...
                            },
                          ),
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.google),
                            color: const Color.fromARGB(255, 66, 133, 244),
                            iconSize: 30.0,
                            onPressed: () {
                              // Make authenticated requests to Google...
                            },
                          ),
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.qrcode),
                            color: const Color.fromARGB(255, 103, 93, 194),
                            iconSize: 30.0,
                            onPressed: () {
                              // Make authenticated requests to Google...
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                          ),
                          children: <TextSpan>[
                            const TextSpan(text: "Don't have an account? "),
                            TextSpan(
                              text: 'Register here',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigate to sign-up page or do something else
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
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
