import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/pages/favorite_page.dart';
import 'package:quotes_app/pages/quote_page.dart';
import 'package:quotes_app/pages/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const QuoteApp());
}

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        SplashPage.id:(context)=>const SplashPage(),
        QuotePage.id:(context)=>const QuotePage(),
        FavQuotes.id:(context)=>const FavQuotes()
      },
      initialRoute:SplashPage.id,
    );

  }
}
