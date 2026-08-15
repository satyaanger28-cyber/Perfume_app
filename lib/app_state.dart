import 'package:flutter/foundation.dart';
import 'models/perfume.dart';

class AppState extends ChangeNotifier {
  final Set<String> _favoriteIds = {};
  final Map<String, int> _cartQuantities = {}; // perfumeId -> quantity

  bool isFavorite(String id) => _favoriteIds.contains(id);

  void toggleFavorite(String id) {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    notifyListeners();
  }

  int quantityInCart(String id) => _cartQuantities[id] ?? 0;

  void addToCart(String id) {
    _cartQuantities[id] = (_cartQuantities[id] ?? 0) + 1;
    notifyListeners();
  }

  void removeFromCart(String id) {
    if (!_cartQuantities.containsKey(id)) return;
    final current = _cartQuantities[id]!;
    if (current <= 1) {
      _cartQuantities.remove(id);
    } else {
      _cartQuantities[id] = current - 1;
    }
    notifyListeners();
  }

  Map<String, int> get cartQuantities => Map.unmodifiable(_cartQuantities);

  int get totalItemsInCart =>
      _cartQuantities.values.fold(0, (sum, qty) => sum + qty);

  double totalPrice(List<Perfume> catalog) {
    double total = 0;
    _cartQuantities.forEach((id, qty) {
      final perfume = catalog.firstWhere((p) => p.id == id);
      total += perfume.price * qty;
    });
    return total;
  }
}
