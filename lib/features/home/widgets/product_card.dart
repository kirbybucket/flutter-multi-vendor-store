import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor_store/core/common/widgets/shimmer_widget.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String imageUrl;
  final VoidCallback onTap;
  final VoidCallback onCartTap;
  final bool useResponsiveFont;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.onTap,
    required this.onCartTap,
    this.useResponsiveFont = true,
  });

  double _getFontSize(BuildContext context) {
    if (!useResponsiveFont) return 14.0;
    return MediaQuery.of(context).size.width < 400 ? 12.0 : 14.0;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey[300]!),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.3)
                  : Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 140,
              child: _buildImage(context),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: _getFontSize(context),
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '\$${price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: _getFontSize(context),
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? Colors.white70
                                  : Theme.of(context).primaryColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            constraints: const BoxConstraints(
                              minHeight: 26,
                              minWidth: 26,
                            ),
                            padding: const EdgeInsets.all(4),
                            onPressed: onCartTap,
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: useResponsiveFont
                                  ? (MediaQuery.of(context).size.width < 400
                                      ? 20
                                      : 24)
                                  : 24,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Stack(
      children: [
        const ShimmerWidget(
          width: double.infinity,
          height: 140,
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          child: Image.network(
            imageUrl,
            width: double.infinity,
            height: 140,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const SizedBox();
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 140,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 32,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
