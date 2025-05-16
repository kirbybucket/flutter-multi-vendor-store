import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor_store/features/home/widgets/product_card.dart';
import 'package:flutter_multi_vendor_store/features/products/models/product_model.dart';

class PersonalizedRecommendations extends StatelessWidget {
  const PersonalizedRecommendations({super.key});

  // dummy recommend products
  static final List<Product> recommendedProducts = [
    Product(
      id: 'rec1',
      name: 'Wireless Earbuds',
      description: 'High-quality sound with noise cancellation',
      price: 129.99,
      images: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHC178pwgs0Fhzb6QWfZYY9HWYLtwpTXaEKg&s'
      ],
      category: 'Electronics',
      sellerId: '1',
      stock: 10,
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'rec2',
      name: 'Smart Watch',
      description: 'Feature-rich smartwatch with health tracking',
      price: 199.99,
      images: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRycJFC-K_NUePTxMzv8IK4t35M69QY_Un3iA&s'
      ],
      category: 'Electronics',
      sellerId: '1',
      stock: 15,
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'rec3',
      name: 'Running Shoes',
      description: 'Confortable running shoes for athletes',
      price: 89.99,
      images: [''],
      category: 'Sports',
      sellerId: '1',
      stock: 20,
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'rec4',
      name: 'Backpack',
      description: 'Durable backpack for everyday use',
      price: 49.99,
      images: [''],
      category: 'Fashion',
      sellerId: '1',
      stock: 25,
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          'Recommended for You',
          context,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 270,
          child: ListView.builder(
            itemBuilder: (context, index) {
              final product = recommendedProducts[index];
              return SizedBox(
                width: 180,
                child: ProductCard(
                  name: product.name,
                  price: product.price,
                  imageUrl: product.images[0],
                  onTap: () {
                    // Handle product tap
                  },
                  onCartTap: () {
                    // Handle add to cart tap
                  },
                  useResponsiveFont: false,
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black,
                fontSize: 17,
              ),
        )
      ],
    );
  }
}
