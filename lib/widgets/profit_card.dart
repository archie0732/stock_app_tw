import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ProfitCard extends StatelessWidget {
  const ProfitCard({super.key});

  final portfolioValue = '13,240,100.00', valueUpDown = '1.72';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(2, 207, 217, 1),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [BoxShadow(color: const Color.fromARGB(31, 3, 40, 58), blurRadius: 10, offset: Offset(0, 2))],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Portfolio value',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white70, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '\$$portfolioValue',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      '$valueUpDown%',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 3),
                    Icon(Symbols.arrow_circle_up, color: const Color.fromARGB(231, 255, 252, 252), fill: 1.0),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),

            _ProfitLossRow(),
          ],
        ),
      ),
    );
  }
}

class _ProfitLossRow extends StatelessWidget {
  Widget _buildGrainLossItem(String label, String value, Color dot, BuildContext content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: dot,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: const Color.fromARGB(66, 47, 91, 94), blurRadius: 1.0, offset: Offset(0, 1))],
          ),
        ),
        SizedBox(width: 6),
        Row(
          children: [
            Text(
              '$label: ',
              style: Theme.of(content).textTheme.bodyLarge?.copyWith(color: Colors.white70, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$$value',
              style: Theme.of(content).textTheme.bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    BuildContext content = context;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(color: Color.fromARGB(110, 157, 240, 248), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildGrainLossItem('Gain', '234.11', Color.fromRGBO(253, 0, 0, 1), content),
          _buildGrainLossItem('Loss', '34.4', const Color.fromARGB(255, 5, 91, 0), content),
        ],
      ),
    );
  }
}
