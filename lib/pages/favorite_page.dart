import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/models/quote_model.dart';
import 'package:quotes_app/pages/quote_page.dart';
import 'package:quotes_app/widgets/fav_quote_card.dart';


class FavQuotes extends StatefulWidget{
  const FavQuotes({super.key});
  static String id='FavQuotes ';

  @override
  State<FavQuotes> createState() => _FavQuotesState();
}

class _FavQuotesState extends State<FavQuotes> {
  int selectedIndex = 1;

  final List<Widget> pages=[
    const QuotePage(),
    const FavQuotes(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if(index==0){
      Navigator.pushNamed(context, QuotePage.id);
    }
  }

  CollectionReference quotes=FirebaseFirestore.instance.collection('quotes');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:quotes.snapshots() ,
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<QuoteModel> quotesList=[];
            for(int i=0; i<snapshot.data!.docs.length;i++){
              quotesList.add(QuoteModel.fromJson(snapshot.data!.docs[i]));
            }
           return Scaffold(
             body: Padding(
               padding: const EdgeInsets.only(top: 30,right: 20,left: 20),
               child: ListView.builder(
                   itemCount:quotesList.length,
                   itemBuilder:(context,index){
                     return  Padding(
                       padding:const EdgeInsets.only(bottom: 28),
                       child: FavQuoteCard(quote:quotesList[index].quote ,
                                        authorName:quotesList[index].authorName,),
                     );
                   } ),

             ),

             bottomNavigationBar: BottomNavigationBar(
               currentIndex: selectedIndex,
               selectedItemColor:Colors.orange,
               onTap: onItemTapped,
               items:const[
                 BottomNavigationBarItem(icon:Icon(Icons.home ,),
                   label: 'Home',),
                 BottomNavigationBarItem(icon: Icon(Icons.favorite_border),
                     label: 'favorites'),
               ],

             ),

           );

     }
         else{
            return const Center(child: CircularProgressIndicator(),);
          }


        });
  }
}