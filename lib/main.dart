import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmDirect',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: ProductListPage(),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String image;
  final String location;

  const Product({
    required this.name,
    required this.price,
    required this.image,
    required this.location,
  });
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    const Product(
      name: 'Fresh 🍅 Tomatoes',
      price: '\$2.50/kg',
      image: 'https://example.com/tomatoes.png',
      location: 'Location 1 🌱',
    ),
    const Product(
      name: 'Organic 🥔 Potatoes',
      price: '\$1.80/kg',
      image: 'https://example.com/potatoes.png',
      location: 'Location 2 🌾',
    ),
    // Add more products as required
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmDirect - Products 🛒'),
        actions: [
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapsPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Image.network(product.image, width: 50, height: 50),
        title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(product.price),
        trailing: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${product.name} added to cart 🛒')),
            );
          },
          child: const Text('Buy Now 🏷️'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        ),
      ),
    );
  }
}

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Location 📍'),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.7749, -122.4194),
          zoom: 10,
        ),
        markers: {
          Marker(
            markerId: MarkerId('location1'),
            position: const LatLng(37.7749, -122.4194),
            infoWindow: const InfoWindow(title: 'Farmer Location 🌱'),
          ),
        },
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  final String productName;

  const PaymentPage({super.key, required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment for $productName 💳')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Simulate payment gateway redirection (use url_launcher for external payment link)
            final url = 'https://example.com/payment';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: const Text('Proceed to Payment 💵'),
        ),
      ),
    );
  }
}
