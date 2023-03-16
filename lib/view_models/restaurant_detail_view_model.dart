import 'package:flutter/foundation.dart';
import '/models/restaurant.dart';
import '/services/api_service.dart';

class RestaurantDetailViewModel with ChangeNotifier {
  Restaurant? _restaurant;

  Restaurant? get restaurant => _restaurant;

  Future<void> fetchRestaurantDetails(String restaurantId) async {
    final data = await ApiService.getRestaurantData();
    final restaurants = data['restaurants'];
    _restaurant = restaurants.firstWhere((r) => r['id'] == restaurantId,
        orElse: () => null);
    notifyListeners();
  }
}
