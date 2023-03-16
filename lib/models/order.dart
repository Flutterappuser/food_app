import 'menu.dart';

enum OrderStatus { Pending, Confirmed, InProgress, Delivered, Cancelled }

class Order {
  final int id;
  final List<MenuItem> items;
  final double totalPrice;
  final int userId;
  final int restaurantId;
  OrderStatus status;

  Order({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.userId,
    required this.restaurantId,
    this.status = OrderStatus.Pending,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      items: (json['items'] as List)
          .map((item) => MenuItem.fromJson(item))
          .toList(),
      totalPrice: json['totalPrice'].toDouble(),
      userId: json['userId'],
      restaurantId: json['restaurantId'],
      status: OrderStatus.values[json['status']],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'items': items.map((item) => item.toJson()).toList(),
        'totalPrice': totalPrice,
        'userId': userId,
        'restaurantId': restaurantId,
        'status': status.index,
      };
}
