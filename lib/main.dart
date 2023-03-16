import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/restaurant_list_screen.dart';
import 'view_models/restaurant_list_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurantListViewModel = RestaurantListViewModel();

    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => RestaurantListViewModel(),
        child: RestaurantListScreen(),
      ),
    );
  }
}
