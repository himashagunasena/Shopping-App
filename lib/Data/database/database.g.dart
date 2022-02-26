// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CartDao? _cartDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CartItem` (`itemid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `price` INTEGER NOT NULL, `qty` INTEGER NOT NULL, `selecteqty` INTEGER NOT NULL, `name` TEXT NOT NULL, `image` TEXT NOT NULL, `uid` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CartDao get cartDao {
    return _cartDaoInstance ??= _$CartDao(database, changeListener);
  }
}

class _$CartDao extends CartDao {
  _$CartDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _cartItemInsertionAdapter = InsertionAdapter(
            database,
            'CartItem',
            (CartItem item) => <String, Object?>{
                  'itemid': item.itemid,
                  'price': item.price,
                  'qty': item.qty,
                  'selecteqty': item.selecteqty,
                  'name': item.name,
                  'image': item.image,
                  'uid': item.uid
                },
            changeListener),
        _cartItemUpdateAdapter = UpdateAdapter(
            database,
            'CartItem',
            ['itemid'],
            (CartItem item) => <String, Object?>{
                  'itemid': item.itemid,
                  'price': item.price,
                  'qty': item.qty,
                  'selecteqty': item.selecteqty,
                  'name': item.name,
                  'image': item.image,
                  'uid': item.uid
                },
            changeListener),
        _cartItemDeletionAdapter = DeletionAdapter(
            database,
            'CartItem',
            ['itemid'],
            (CartItem item) => <String, Object?>{
                  'itemid': item.itemid,
                  'price': item.price,
                  'qty': item.qty,
                  'selecteqty': item.selecteqty,
                  'name': item.name,
                  'image': item.image,
                  'uid': item.uid
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CartItem> _cartItemInsertionAdapter;

  final UpdateAdapter<CartItem> _cartItemUpdateAdapter;

  final DeletionAdapter<CartItem> _cartItemDeletionAdapter;

  @override
  Stream<List<CartItem>> getAllCartItemByUid(String uid) {
    return _queryAdapter.queryListStream('SELECT* FROM CartItem WHERE uid=?1',
        mapper: (Map<String, Object?> row) => CartItem(
            itemid: row['itemid'] as int,
            price: row['price'] as int,
            name: row['name'] as String,
            image: row['image'] as String,
            qty: row['qty'] as int,
            uid: row['uid'] as String,
            selecteqty: row['selecteqty'] as int),
        arguments: [uid],
        queryableName: 'CartItem',
        isView: false);
  }

  @override
  Future<CartItem?> getCartItemByUid(String uid, int id) async {
    return _queryAdapter.query('SELECT* FROM CartItem WHERE uid=?1 and id=?2',
        mapper: (Map<String, Object?> row) => CartItem(
            itemid: row['itemid'] as int,
            price: row['price'] as int,
            name: row['name'] as String,
            image: row['image'] as String,
            qty: row['qty'] as int,
            uid: row['uid'] as String,
            selecteqty: row['selecteqty'] as int),
        arguments: [uid, id]);
  }

  @override
  Stream<List<CartItem>> clearCartItemByUid(String uid) {
    return _queryAdapter.queryListStream('DELETE* FROM CartItem WHERE uid=?1',
        mapper: (Map<String, Object?> row) => CartItem(
            itemid: row['itemid'] as int,
            price: row['price'] as int,
            name: row['name'] as String,
            image: row['image'] as String,
            qty: row['qty'] as int,
            uid: row['uid'] as String,
            selecteqty: row['selecteqty'] as int),
        arguments: [uid],
        queryableName: 'CartItem',
        isView: false);
  }

  @override
  Future<void> updateCartItemByUid(String uid) async {
    await _queryAdapter
        .queryNoReturn('UPDATE* FROM CartItem WHERE uid=?1', arguments: [uid]);
  }

  @override
  Future<void> insertCartItem(CartItem item) async {
    await _cartItemInsertionAdapter.insert(item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateCartItem(CartItem item) {
    return _cartItemUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteCartItem(CartItem item) {
    return _cartItemDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}
