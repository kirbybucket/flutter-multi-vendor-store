import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final String searchQuery;
  final Function(String) onSearchChanged;
  final VoidCallback onFilterTap;
  final bool isSearching;

  const HomeSearchBar(
      {super.key,
      required this.searchQuery,
      required this.onSearchChanged,
      required this.onFilterTap,
      required this.isSearching});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: isDark ? Colors.white : Colors.black87),
              decoration: InputDecoration(
                hintText: 'Search products...',
                hintStyle: TextStyle(
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
                border: InputBorder.none,
                icon: Icon(
                  Icons.search,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
                suffixIcon: isSearching
                    ? IconButton(
                        onPressed: () => onSearchChanged(''),
                        icon: Icon(
                          Icons.clear,
                          color: isDark ? Colors.grey[400] : Colors.grey[600],
                        ),
                      )
                    : null,
              ),
              onChanged: onSearchChanged,
            ),
          ),
          if (!isSearching)
            IconButton(
              onPressed: onFilterTap,
              icon: Icon(
                Icons.filter_list,
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
        ],
      ),
    );
  }
}
