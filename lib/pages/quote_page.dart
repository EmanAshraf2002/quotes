import 'package:flutter/material.dart';
import 'package:quotes_app/models/quote_model.dart';
import 'package:quotes_app/pages/favorite_page.dart';
import 'package:quotes_app/services/quote_service.dart';
import 'package:quotes_app/widgets/qoute_card.dart';


class QuotePage extends StatefulWidget {
  const QuotePage({super.key,});
  static String id = 'QuotePage';

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  QuoteModel? qObj;
  int selectedIndex = 0;

  final List<Widget> pages=[
    const QuotePage(),
    const FavQuotes(),
  ];

   void onItemTapped(int index) {
     setState(() {
       selectedIndex = index;
     });
     if(index==1){
       Navigator.pushNamed(context, FavQuotes.id);
     }
   }


   bool isLoading=false;
   Future<void> fetchQuote() async{
     setState(() {
       isLoading=true;
     });
      QuoteModel quotModel  = await  QuoteService().getQuote();

     setState(() {
       qObj=quotModel;
       isLoading=false;
     });

   }

   @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed:(){ fetchQuote(); } ,
              icon:const Icon(Icons.refresh_outlined , color:Colors.black,)),
        ],
      ),
      body: Padding(
        padding:
        const EdgeInsets.only(top:25, left:20, right: 20,),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Text(
              'HELLO!',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'titleFont',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8,),
            const Text(
              "Here,is your quote of the day",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'titleFont',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height:50,),
            Center(
              child:isLoading?const CircularProgressIndicator(): qObj != null?
              QuoteCard(quote:qObj!.quote,
                authorName: qObj!.authorName,):const Text('Failed to fetch quote'),
            ),
          ],
        ),
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
}

