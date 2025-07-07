import 'package:flutter/material.dart';
import 'package:taskbygithub/quotes/quotes_helper.dart';

class MyQuotesScreen extends StatelessWidget {
  const MyQuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quotes")),
      body: FutureBuilder(
        future: QuotesHelper().getQuotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong."));
          }

          final quotes = snapshot.data;

          if (quotes == null || quotes.isEmpty) {
            return const Center(child: Text("No quotes found."));
          }

          return ListView.builder(
            itemCount: quotes.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                //leading: const Icon(Icons.format_quote),
                title: Text(quotes[index].author),
                subtitle: Text(quotes[index].category),
                children: [
                  TextSelectionGestureDetector(
                    child: Text(quotes[index].quote),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
