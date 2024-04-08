import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Page'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
    
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
           Column(
             children: [
               const SizedBox(height: 200,),
               SvgPicture.asset('assets/notif_logo.svg'),
                const Text(
                  'Turn on notifications?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 250,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    'Don’t miss important messages like check-in details and account activity',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
                    softWrap: true,
                  ),
                ),
             ],
           ),
            Column(
                children: <Widget>[
                  ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff675DC2), minimumSize:const Size(400, 80),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  onPressed: 
                  (){}, 
                  child: const Text('Enable notification',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400, fontSize: 20),),
                  
                  ),
                  const SizedBox(height: 20,),
                  const TextButton(
                    onPressed: null, 
                    child: Text('Skip',
                  style: TextStyle(color:  Color(0xff675DC2),fontWeight: FontWeight.w400, fontSize: 15),)),
                ],
              )
          ],
        ),
      ),
    );
  }
}