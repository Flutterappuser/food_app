import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/restaurant.dart';
import '/view_models/restaurant_list_view_model.dart';

class RestaurantListScreen extends StatefulWidget {
  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      Provider.of<RestaurantListViewModel>(context, listen: false)
          .fetchRestaurants();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RestaurantListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
      ),
      body: Center(
        child: viewModel.isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: viewModel.restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = viewModel.restaurants[index];
                  return Card(
                    child: ListTile(
                      title: Text(restaurant.name ?? 'test'),
                      subtitle: Text(restaurant.description ?? 'test'),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
