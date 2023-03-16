import 'package:flutter/foundation.dart';
import '../models/restaurant.dart';
import '/services/api_service.dart';

// class RestaurantListViewModel1 with ChangeNotifier {
//   List<dynamic> _restaurants = [];

//   List<dynamic> get restaurants => _restaurants;

//   Future<void> fetchRestaurants() async {
//     final data = await ApiService.getRestaurantData();
//     _restaurants = data['restaurants'];
//     notifyListeners();
//   }
// }

class RestaurantListViewModel extends ChangeNotifier {
  List<Restaurant> _restaurants = [];
  List<Restaurant> get restaurants => _restaurants;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchRestaurants() async {
    print('fetchRestaurants called');
    try {
      _isLoading = true;
      notifyListeners();
      final restaurantData = await ApiService.getRestaurantData();
      final restaurantList = restaurantData['restaurants'] as List;
      print('res_list: $restaurantList');

      _restaurants =
          restaurantList.map((json) => Restaurant.fromJson(json)).toList();
      print('_restaurants: $_restaurants');
      final _menus = _restaurants.map((restaurant) => restaurant.menu).toList();

      _isLoading = false;
      notifyListeners();
      print('fetchRestaurants succeeded');
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print('fetchRestaurants failed: $e');
    }
  }
}
