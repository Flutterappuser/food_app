import 'package:flutter/foundation.dart';
import '/services/api_service.dart';

class MenuListViewModel with ChangeNotifier {
  List<dynamic> _menuItems = [];

  List<dynamic> get menuItems => _menuItems;

  Future<void> fetchMenuItems() async {
    final data = await ApiService.getRestaurantData();
    _menuItems = data['menu'];
    notifyListeners();
  }
}
