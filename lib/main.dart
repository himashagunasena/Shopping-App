
import 'package:ecommerce/Data/database/database.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

import 'Data/Dao/cart_dao.dart';
import 'Presentation/View/homeApp.dart';
import 'Utils/utils.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
  await $FloorAppDatabase.databaseBuilder("shopping_cart.db").build();
  final dao = database.cartDao;
  runApp(MyApp(dao));
}
class MyApp extends StatelessWidget {
final CartDao dao;
MyApp(this.dao);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: TextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: Home(dao:dao),
    );
  }
}

