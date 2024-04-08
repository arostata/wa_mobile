

import 'package:flutter/material.dart';

//import 'first_page_model.dart';
//export 'first_page_model.dart';

class MainPageFirstWidget extends StatefulWidget {
  const MainPageFirstWidget({Key? key}) : super(key: key);

  @override
  State<MainPageFirstWidget> createState() => _MainPageFirstWidgetState();
}

class _MainPageFirstWidgetState extends State<MainPageFirstWidget> {
  //late FirstPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => FirstPageModel());
  }

  @override
  void dispose() {
    //_model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     // onTap: () => _model.unfocusNode.canRequestFocus
     //     ? FocusScope.of(context).requestFocus(_model.unfocusNode)
    //      : FocusScope.of(context).unfocus(),
    
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
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
        //  backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, -0.11),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'lib/assets/NoExamLogo.png',
                      width: 165,
                      height: 155,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional(0, 0.21),
                  child: Text(
                    'You don’t have any \nupcoming exam',
                    textAlign: TextAlign.center,
                    style: TextStyle(

                          fontFamily: 'Readex Pro',
                          fontSize: 25,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional(0, 0.48),
                  child: Text(
                    'By clicking the button below, you will be redirected \nto the official website of Webassessor.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0.73),
                   child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff675DC2), minimumSize:const Size(400, 80),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'Register another exam',
                   style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400, fontSize: 20),),            
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
