import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantMenuApp());
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F9FF),
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}

// Food information
class FoodItem {
  final String name;
  final String category;
  final String description;
  final String ingredients;
  final double price;
  final IconData icon;

  const FoodItem({
    required this.name,
    required this.category,
    required this.description,
    required this.ingredients,
    required this.price,
    required this.icon,
  });
}

// List of food items
const List<FoodItem> menuItems = [
  FoodItem(
    name: 'Nasi Lemak',
    category: 'Main Course',
    description:
        'Fragrant coconut rice served with sambal, anchovies, peanuts, '
        'cucumber and egg.',
    ingredients: 'Coconut rice, sambal, anchovies, peanuts, cucumber and egg',
    price: 8.50,
    icon: Icons.rice_bowl,
  ),
  FoodItem(
    name: 'Cendol',
    category: 'Dessert',
    description:
        'A refreshing dessert made with shaved ice, green jelly, '
        'coconut milk and gula melaka syrup.',
    ingredients: 'Shaved ice, pandan jelly, coconut milk and gula melaka',
    price: 5.00,
    icon: Icons.icecream,
  ),
  FoodItem(
    name: 'Teh Tarik',
    category: 'Beverage',
    description:
        'A popular Malaysian milk tea made by pouring tea between '
        'two containers until it becomes frothy.',
    ingredients: 'Black tea and condensed milk',
    price: 3.50,
    icon: Icons.local_cafe,
  ),
];

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Today's Menu",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Choose your favourite food!',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),

          const SizedBox(height: 16),

          // Display the three food cards
          for (final item in menuItems)
            Card(
              color: Colors.lightBlue.shade50,
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Colors.lightBlue, width: 1),
              ),

              child: ListTile(
                contentPadding: const EdgeInsets.all(12),

                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.blue.shade100,
                  child: Icon(item.icon, size: 30, color: Colors.blue.shade800),
                ),

                title: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    '${item.category}\nRM ${item.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ),

                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Colors.blue,
                ),

                // Open the food details when tapped
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetailScreen(item: item),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

// Food details screen (optional task)
class FoodDetailScreen extends StatelessWidget {
  final FoodItem item;

  const FoodDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue.shade100,
                child: Icon(item.icon, size: 65, color: Colors.blue.shade800),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              item.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 8),

            Text(item.category, style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 12),

            Text(
              'RM ${item.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const Divider(height: 32),

            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(item.description, style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 20),

            const Text(
              'Ingredients',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(item.ingredients, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
