import 'dart:async';

import 'package:ecommerce/Data/Dao/cart_dao.dart';
import 'package:ecommerce/Data/entity/cart_item.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart';
@Database(version:1,entities:[CartItem])

abstract class AppDatabase extends FloorDatabase{ CartDao get cartDao;}