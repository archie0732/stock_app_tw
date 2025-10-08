import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

// test area

class WishlistItem {
  final IconData icon;
  final String symbol;
  final String price;
  final double change;

  WishlistItem(this.icon, this.symbol, this.price, this.change);
}

final List<WishlistItem> myWishlist = [
  WishlistItem(Symbols.abc, 'TSLA', '2300.00', -0.25),
  WishlistItem(Symbols.favorite, 'AAPL', '175.50', 1.50),
  WishlistItem(Symbols.account_balance, 'GOOGL', '1500.00', 0.88),
  WishlistItem(Symbols.ac_unit, 'AMZN', '3400.00', -0.50),
];

// test end

class WishstockSelector extends StatefulWidget {
  const WishstockSelector({super.key});

  @override
  State<WishstockSelector> createState() => _WishstockSelector();
}

class _WishstockSelector extends State<WishstockSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('WishList', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              Icon(Symbols.add_circle, size: 30, fontWeight: FontWeight.bold),
            ],
          ),
          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemCount: myWishlist.length,
              itemBuilder: (context, index) {
                final item = myWishlist[index];
                return Padding(padding: const EdgeInsets.only(bottom: 12), child: wishList(item.icon, item.symbol, item.price, item.change));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget wishList(IconData icon, String company, String stockSymbol, double percentageChange) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(icon)),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(company, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                Text('$company,Inc', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Text('\$$stockSymbol', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(
              percentageChange < 0 ? '$percentageChange%' : '+$percentageChange%',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: percentageChange >= 0 ? Colors.green : Colors.red),
            ),
          ],
        ),
      ],
    );
  }
}
