import 'package:flutter/material.dart';
import 'package:quotes_app/pages/quote_page.dart';

class SplashPage extends StatelessWidget{
  const SplashPage({super.key});
  static String id='SplashPage' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              clipBehavior:Clip.none,
              height:150,
              width:150,
              child:const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('lib/fonts/quot.jpg'),
                radius: 200,
              ),

            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'GET INSPIRED EVERYDAY WITH QUOTES APP ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'titleFont',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Welcome to our inspiring world of quotes! Dive into a treasure trove of wisdom,',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
            ),
            const Text(
              'motivation, and thought-provoking words that will uplift your spirits and ignite your imagination. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const QuotePage() ;
                }));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    return Colors.white;
                  },
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Tap To Start ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize:20,
                    fontWeight: FontWeight.bold,
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