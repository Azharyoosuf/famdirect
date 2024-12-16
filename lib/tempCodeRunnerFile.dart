import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Direct',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example product data
    final products = [
      {'name': 'Fresh Tomatoes', 'price': '\$2.50/kg', 'image': '🍅'},
      {'name': 'Organic Potatoes', 'price': '\$1.80/kg', 'image': '🥔'},
      {'name': 'Farm Eggs', 'price': '\$3.00/dozen', 'image': '🥚'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Farm Direct'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Text(
                product['image']!,
                style: const TextStyle(fontSize: 32),
              ),
              title: Text(product['name']!),
              subtitle: Text(product['price']!),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product['name']} added to cart!'),
                    ),
                  );
                },
                child: const Text('Buy'),
              ),
            ),
          );
        },
      ),
    );
  }
}
