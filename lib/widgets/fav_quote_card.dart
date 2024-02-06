import 'package:flutter/material.dart';
import 'package:quotes_app/helper/cloud_funcations.dart';
import 'package:quotes_app/models/quote_model.dart';
import 'package:share/share.dart';


class FavQuoteCard extends StatefulWidget {
  FavQuoteCard({
    super.key, required this.quote, required this.authorName ,
  });

  final String quote;
  final String authorName;



  @override
  State<FavQuoteCard> createState() => _FavQuoteCardState();
}

class _FavQuoteCardState extends State<FavQuoteCard> {
  bool isFav=false;
  QuoteModel? quote_model;



  @override
  Widget build(BuildContext context) {
    return Container(
      height:380,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(8, 8),
          ),
        ],
      ),
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.quote ,
                  style:const TextStyle(fontSize: 20 ,fontFamily: 'titleFont',
                    fontWeight: FontWeight.bold),
               ),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(widget.authorName,
                      style:const TextStyle(
                       fontSize: 16,
                       fontFamily: 'titleFont',
                       fontWeight: FontWeight.bold,
                    ),
                  ),
                     IconButton(
                      onPressed: () {
                       CloudFunctions().openShareDialog(context,widget.quote);
                      },
                      icon: const Icon(Icons.share),
                  ),

                ],
              ),
            ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
