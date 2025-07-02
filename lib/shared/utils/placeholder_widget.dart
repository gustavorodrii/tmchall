import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderHeader extends StatelessWidget {
  const PlaceholderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF2C2C2C),
      highlightColor: const Color(0xFF3C3C3C),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class PlaceholderCards extends StatelessWidget {
  final int count;
  const PlaceholderCards({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    return GridView.count(
      crossAxisCount: isWide ? 4 : 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        count,
        (_) => Shimmer.fromColors(
          baseColor: const Color(0xFF2C2C2C),
          highlightColor: const Color(0xFF3C3C3C),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}

class PlaceholderSection extends StatelessWidget {
  const PlaceholderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        2,
        (_) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Shimmer.fromColors(
            baseColor: const Color(0xFF2C2C2C),
            highlightColor: const Color(0xFF3C3C3C),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
