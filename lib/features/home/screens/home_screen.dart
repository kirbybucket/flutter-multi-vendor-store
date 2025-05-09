import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor_store/features/home/widgets/home_app_bar.dart';
import 'package:flutter_multi_vendor_store/features/home/widgets/home_search_bar.dart';

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

  void _showFilterDialog() {}

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
