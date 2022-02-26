import 'package:ecommerce/Data/entity/cart_item.dart';
import 'package:floor/floor.dart';

@dao
abstract class CartDao {
  @Query('SELECT* FROM CartItem WHERE uid=:uid')
  Stream<List<CartItem>> getAllCartItemByUid(String uid);

  @Query('SELECT* FROM CartItem WHERE uid=:uid and id=:id')
  Future<CartItem?> getCartItemByUid(String uid, int id);

  @Query('DELETE* FROM CartItem WHERE uid=:uid')
  Stream<List<CartItem>> clearCartItemByUid(String uid);

  @Query('UPDATE* FROM CartItem WHERE uid=:uid')
  Future<void> updateCartItemByUid(String uid);

  @insert
  Future<void> insertCartItem(CartItem item);

  @update
  Future<int> updateCartItem(CartItem item);

  @delete
  Future<int> deleteCartItem(CartItem item);
}

List<CartItem> item=[];