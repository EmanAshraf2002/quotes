class QuoteModel{

  final String quote;
  final String authorName;

  const QuoteModel({required this.quote ,required this.authorName});
  factory QuoteModel.fromJson(json){
    return QuoteModel(quote: json['quote'], authorName: json['author']);

  }

}