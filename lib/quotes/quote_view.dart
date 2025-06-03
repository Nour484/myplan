import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_model.dart';
import 'quote.dart';
import 'quote_service.dart';

class QuoteView extends StatefulWidget {
  const QuoteView({super.key});

  @override
  State<QuoteView> createState() => _QuoteViewState();
}

class _QuoteViewState extends State<QuoteView> {
  late Future<List<Quote>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = QuoteService().fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color:  Colors.blue.shade50,
          image: DecorationImage(
        fit: BoxFit.cover,
        image:  Provider.of<ThemeModel>(context).lightModel ?   AssetImage("asset/d2.jpeg") :  AssetImage("asset/d1.jpeg"),
      )

      ),
      child: FutureBuilder<List<Quote>>(
          future: futureAlbum,
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return ListView.builder(
                itemCount: snapShot.data!.length,
                itemBuilder: (context, index) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(

                        children: [
                          SizedBox(
                            height: 150,
                          ),

                          Container(

                            color: Provider.of<ThemeModel>(context).lightModel ? Colors.black54 : Colors.white70 ,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [ Center(
                                child:
                              Text(snapShot.data![index].quote , style: TextStyle(fontSize: 18, fontFamily: "Merienda" , fontWeight: FontWeight.bold),) ,),

                                 SizedBox(height: 20,) ,
                                 Text('"${snapShot.data![index].author}"' , style: TextStyle(fontSize: 18, fontFamily: "Merienda" , fontWeight: FontWeight.bold),),
                                Text('"${snapShot.data![index].category}"'  , style: TextStyle(fontSize: 15, fontFamily: "Merienda"  ,  fontWeight: FontWeight.bold)),  ],),
                            ),
                          ),

                        ],

                    ),
                  ),
                ),
              );
            } else if (snapShot.hasError) {
              return Center(child: Text("${snapShot.hasError}"));
              //   Center(
              //     child: Icon(
              //   Icons.wifi_off_rounded,
              //   size: 200,
              //   color: Colors.green.shade100,
              // ));
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
