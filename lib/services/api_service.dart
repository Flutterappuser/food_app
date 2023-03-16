import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<dynamic> getRestaurantData() async {
    print('getRestaurantData called');
    final String jsonStr = await rootBundle.loadString(
        'assets/restaurants.json'); // replace with the path to your JSON file

    print('jsonStr: $jsonStr');

    final jsonData = json.decode(jsonStr);

    print('jsonData: $jsonData');

    return jsonData;
  }
}

Future<void> fetchRestaurantData() async {
  final restaurantData = await ApiService.getRestaurantData();

  // get the menu items from the restaurant data
  final menuItems = restaurantData['menu'];

  // do something with the menu items, e.g. print the names
  for (final item in menuItems) {
    print(item['name']);
  }
}
