import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:taskbygithub/profile/profile_model.dart';
import 'package:taskbygithub/profile/profile_model/profile.dart';
import 'package:path_provider/path_provider.dart';

import 'add_items/item_model.dart';
import 'favorite/favorite_model.dart';
import 'home/home_page.dart';

void main()  async{


  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  Hive.registerAdapter(ProfileAdapter());

  await Hive.openBox<Profile>('profile');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (BuildContext context) => ItemModel(),
    ),

    ChangeNotifierProvider(
      create: (BuildContext context) => FavoriteModel(),
    ),
    ChangeNotifierProvider(
      create: (BuildContext context) => ProfileModel(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  showSemanticsDebugger: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
