import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/quote_model.dart';
class QuoteService{

  Future<QuoteModel> getQuote() async{
     try {
       http.Response response = await http.get(Uri.parse('https://api.api-ninjas.com/v1/quotes?X-Api-Key=gOnmKtuzyzuwqx4qrQnXnOivM6jacY4iWN3cxjoh'));
      if(response.statusCode==200){
        List<dynamic> data=jsonDecode(response.body);
        if(data.isNotEmpty){
          QuoteModel qModel=QuoteModel.fromJson(data[0]);
          return qModel;
        }
        else{
          throw Exception('No quotes available');
         }
      }
      else{
        throw('There is a problem  with the status-code ${response.statusCode}');
      }
     }
     catch (e) {
       throw('There is a problem $e');
     }

  }

}