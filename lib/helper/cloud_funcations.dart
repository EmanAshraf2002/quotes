import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/models/quote_model.dart';
import 'package:share/share.dart';

class CloudFunctions{

  CollectionReference quotes=FirebaseFirestore.instance.collection('quotes');


Future<void> addFavQuote({required QuoteModel quo}) async{
  return quotes.add({
     'quote':quo.quote ,
     'author':quo.authorName ,
  }).then((value) => print("Quote added"))
      .catchError((error)=>print("failed to add quote ${error}"));

}


  void openShareDialog(BuildContext context ,String quote) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text('Share to Social Media'),
          content:const Text('Choose a social media platform to share.'),
          actions: <Widget>[
            TextButton(
              child:const Text('Facebook'),
              onPressed: () {
                Share.share(quote);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child:const Text('Twitter'),
              onPressed: () {
                Share.share(quote);
                Navigator.of(context).pop();
              },
            ),
            // Add more social media options as needed
          ],
        );
      },
    );
  }

}