import 'package:flutter/material.dart';
import '/models/restaurant.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantDetailScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name!),
      ),
      body: Container(
        child: Center(
          child: Text(restaurant.description!),
        ),
      ),
    );
  }
}
