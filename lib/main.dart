import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:stock_tw/widgets/profit_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 1, 194, 212))),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final customAddIcon = Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(color: const Color.fromARGB(255, 3, 196, 213), shape: BoxShape.circle),
      child: const Center(child: Icon(Icons.add, color: Colors.white, size: 24)),
    );
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Symbols.bolt_sharp, color: const Color.fromARGB(255, 42, 241, 221), fill: 1.0, size: 30),
            SizedBox(width: 2),
            Text(
              'R7Stock',
              style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Symbols.notifications, color: const Color.fromARGB(255, 131, 130, 130), weight: 700),
          ),
        ],
        backgroundColor: Colors.white,
      ),

      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(icon: Icon(Symbols.home, weight: 700), label: '', selectedIcon: Icon(Symbols.home, fill: 1.0)),
          NavigationDestination(icon: Icon(Symbols.query_stats_sharp, weight: 700), label: '', selectedIcon: Icon(Symbols.query_stats_sharp, fill: 1.0)),
          //
          NavigationDestination(icon: customAddIcon, label: ''),
          //
          NavigationDestination(icon: Icon(Symbols.book, weight: 700), label: '', selectedIcon: Icon(Symbols.book, fill: 1.0)),
          NavigationDestination(icon: Icon(Symbols.person, weight: 700), label: '', selectedIcon: Icon(Symbols.person, fill: 1.0)),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(height: 26),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0), child: ProfitCard()),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 239, 239),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.0, offset: Offset(0, -5))],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
