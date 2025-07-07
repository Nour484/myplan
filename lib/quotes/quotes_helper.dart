import 'package:taskbygithub/quotes/quote.dart';
import 'package:taskbygithub/service/db_helper.dart';

class QuotesHelper {
  Future<Quote> insertQuote(Quote quote) async {
    final db = await DBHelper().database;

    await db.insert('quotes', quote.toMap());

    return quote;
  }

  Future<List<Quote>> getQuotes() async {
    final db = await DBHelper().database;
    List<Map<String, dynamic>> maps = await db.query('quotes');

    return maps.map((map) => Quote.fromJson(map)).toList();
  }
}
