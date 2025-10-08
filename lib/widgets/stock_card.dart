import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  const StockCard({super.key, required this.icon, required this.companyName, required this.price, required this.change});

  final IconData icon;
  final String companyName;
  final String price;
  final double change;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon, size: 40),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(companyName, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    Text('$companyName, Icn', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$$price', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(
                      change >= 0 ? '+$change%' : '$change%',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: change >= 0 ? Colors.green : Colors.red),
                    ),
                  ],
                ),
                Text('stock line'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
