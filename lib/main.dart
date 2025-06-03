import 'package:flutter/material.dart';
// <<<<<<< HEAD
// import 'package:hive/hive.dart';
// import 'package:provider/provider.dart';
// import 'package:taskbygithub/profile/profile_model.dart';
// import 'package:taskbygithub/profile/profile_model/profile.dart';
// import 'package:path_provider/path_provider.dart';
//
// import 'add_items/item_model.dart';
// import 'favorite/favorite_model.dart';
// import 'home/home_page.dart';
//
// void main()  async{
//
//
//   WidgetsFlutterBinding.ensureInitialized();
//
//   final dir = await getApplicationDocumentsDirectory();
//   Hive.init(dir.path);
//
//   Hive.registerAdapter(ProfileAdapter());
//
//   await Hive.openBox<Profile>('profile');
//=======
import 'package:provider/provider.dart';
import 'package:taskbygithub/theme/theme_mode.dart';
import 'package:taskbygithub/theme/theme_model.dart';
import 'package:taskbygithub/timer/timer_model.dart';
import 'add_items/item_model.dart';
import 'favorite/favorite_model.dart';
import 'home/nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final itemModel = ItemModel();
  await itemModel.loadItemsFromDb();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (BuildContext context) => ItemModel(),
    ),
// <<<<<<< HEAD
//
//     ChangeNotifierProvider(
//       create: (BuildContext context) => FavoriteModel(),
//     ),
//     ChangeNotifierProvider(
//       create: (BuildContext context) => ProfileModel(),
//     )
// =======
    ChangeNotifierProvider(
      create: (BuildContext context) => FavoriteModel(),
    ),

    ChangeNotifierProvider(
      create: (BuildContext context) => TimerProvider(),
    ),
    ChangeNotifierProvider(create: (context) => ThemeModel()..getTheme())
// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
// <<<<<<< HEAD
//       //  showSemanticsDebugger: true,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
//         useMaterial3: true,
//       ),
//       home: HomePage(),
// =======
      debugShowCheckedModeBanner: false,
      //  showSemanticsDebugger: true,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeModel>(context).lightModel
          ? ModeTheme.darkMode
          : ModeTheme.lightMode,

      home: NavBar(),
// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b
    );
  }
}
