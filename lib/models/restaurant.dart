class Restaurant {
  final int? id;
  final String? name;
  final String? description;
  final List<dynamic>? menu;
  Restaurant({
    this.id,
    required this.name,
    required this.description,
    this.menu,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        menu: json['menu'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'menu': menu,
      };
}
