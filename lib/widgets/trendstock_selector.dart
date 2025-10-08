import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:stock_tw/widgets/stock_card.dart';

class TrendCard {
  final IconData icon;
  final String symbol;
  final String price;
  final double change;

  TrendCard(this.icon, this.symbol, this.price, this.change);
}
// test area

final List<TrendCard> mytrendCard = [
  TrendCard(Symbols.body_system, 'body', '2300.00', -0.02),
  TrendCard(Symbols.access_time_filled_sharp, 'Nvidia', '245,300,000.00', 0.12),
  TrendCard(Symbols.apparel, 'apple', '21,211,300.00', 0.012),
];

// end test

class TrendingStocksSection extends StatefulWidget {
  const TrendingStocksSection({super.key});

  @override
  State<TrendingStocksSection> createState() => _TrendingStocksSectionState();
}

class _TrendingStocksSectionState extends State<TrendingStocksSection> {
  int _selectedIndex = 0;

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);

    _pageController.addListener(() {
      int next = _pageController.page!.round();

      if (_selectedIndex != next) {
        setState(() {
          _selectedIndex = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Title(
                color: Colors.black,
                child: Text('Trending', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              ),
              buildPageIndicator(mytrendCard.length + 1),
            ],
          ),
        ),

        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: mytrendCard.length + 1,
            itemBuilder: (context, index) {
              if (index == mytrendCard.length) {
                return buildMoreCard(context);
              }
              final item = index < mytrendCard.length ? mytrendCard[index] : mytrendCard[0];
              return Padding(
                padding: EdgeInsets.all(4),
                child: StockCard(icon: item.icon, companyName: item.symbol, price: item.price, change: item.change),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildPageIndicator(int total) {
    return Row(
      children: List.generate(total, (index) {
        bool isCurIndex = index == _selectedIndex;
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCurIndex ? Theme.of(context).colorScheme.primary : const Color.fromARGB(255, 126, 126, 126),
          ),
        );
      }),
    );
  }

  Widget buildMoreCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 196, 199, 201), width: 2),
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 199, 201, 201),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.primary, size: 36),
              const SizedBox(height: 12),
              Text(
                'View All Trending Stocks',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 4),

              const Text(
                'Browse the full list and market analysis.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
