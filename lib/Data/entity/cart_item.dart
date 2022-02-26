import 'package:ecommerce/Presentation/View/cart.dart';
import 'package:floor/floor.dart';
@entity
class CartItem{ @PrimaryKey(autoGenerate: true)
int itemid;
int price,qty,selecteqty;
String name,image,uid;
CartItem({required this.itemid, required this.price, required this.name, required this.image, required this.qty, required this.uid, required this.selecteqty});}

