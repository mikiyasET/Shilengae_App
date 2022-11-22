import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetValues extends ChangeNotifier {
  String? token;

  Future<SharedPreferences> newMethod() async =>
      await SharedPreferences.getInstance();
  String? _val;
  String? gValues() => _val;

  Future<void> GetValue(String value) async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString(value);
    if (token == null) {
      _val = null;
      notifyListeners();
    }
    notifyListeners();
    _val = token;
  }

  Future<void> SetValue(name, value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(name, value);
    GetValue(name);
    notifyListeners();
  }

  Future<void> ClearValue(value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(value);
    GetValue(value);
    notifyListeners();
  }

  Future<void> ClearAllValues() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    GetValue("sdds");
    notifyListeners();
  }
}

// class CartModel extends ChangeNotifier {
//   /// Internal, private state of the cart.
//   final List<String> _items = ["selam"];

//   /// An unmodifiable view of the items in the cart.
//   UnmodifiableListView<String> get items => UnmodifiableListView(_items);

//   /// The current total price of all items (assuming all items cost $42).
//   int get totalPrice => _items.length * 42;

//   /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
//   /// cart from the outside.
//   void add() {
//     _items.add("item");
//     // This call tells the widgets that are listening to this model to rebuild.
//     notifyListeners();
//   }

//   /// Removes all items from the cart.
//   void removeAll() {
//     _items.clear();
//     // This call tells the widgets that are listening to this model to rebuild.
//     notifyListeners();
//   }
// }
