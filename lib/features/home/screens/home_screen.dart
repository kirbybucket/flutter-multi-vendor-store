import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor_store/features/home/widgets/home_app_bar.dart';
import 'package:flutter_multi_vendor_store/features/home/widgets/home_search_bar.dart';
import 'package:flutter_multi_vendor_store/features/home/widgets/product_filter_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';
  bool get _isSearching => _searchQuery.isNotEmpty;
  bool get _isFiltering =>
      _priceRange != RangeValues(0, 1000) || _selectedCategory != null;
  RangeValues _priceRange = RangeValues(0, 1000);
  String? _selectedCategory;

  // sample category data
  final List<Map<String, dynamic>> categories = [
    {'name': 'Electronics', 'icon': Icons.devices, 'color': Colors.blue},
    {'name': 'Fashion', 'icon': Icons.checkroom, 'color': Colors.pink},
    {'name': 'Books', 'icon': Icons.book, 'color': Colors.green},
    {'name': 'Sports', 'icon': Icons.sports, 'color': Colors.orange},
  ];

  void _showFilterDialog() {
    ProductFilterDialog.show(
      context: context,
      initialPriceRange: _priceRange,
      initialCategory: _selectedCategory,
      categories: categories,
      onApply: (priceRange, category) {
        setState(() {
          _priceRange = priceRange;
          _selectedCategory = category;
        });
      },
      onReset: () {
        setState(() {
          _priceRange = RangeValues(0, 1000);
          _selectedCategory = null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const HomeAppBar(),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              HomeSearchBar(
                searchQuery: _searchQuery,
                isSearching: _isSearching,
                onSearchChanged: (value) {
                  setState(() => _searchQuery = value);
                },
                onFilterTap: () {
                  _showFilterDialog();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
