import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 10 Labs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter 10 Lab Demo'),
      debugShowCheckedModeBanner: false,
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
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // LAB 8: Scaffold
      appBar: AppBar(title: Text(widget.title)),

      // LAB 3: IndexedStack
      body: IndexedStack(
        index: currentIndex,
        children: [
          columnLab(),
          stackLab(),
          indexedStackLab(),
          spacerLab(),
          expandedLab(),
          sizedBoxLab(),
          tweenLab(),
          scaffoldLab(),
          appBarLab(),
          bottomAppBarLab(),
        ],
      ),

      // LAB 10: BottomAppBar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            5,
            (index) => IconButton(
              icon: Icon(Icons.circle),
              onPressed: () {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next),
        onPressed: () {
          setState(() {
            currentIndex = (currentIndex + 1) % 10;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // LAB 1: Column
  Widget columnLab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('Column - Dòng 1'),
        Text('Column - Dòng 2'),
        Text('Column - Dòng 3'),
      ],
    );
  }

  // LAB 2: Stack
  Widget stackLab() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(width: 200, height: 200, color: Colors.blue),
          Container(width: 100, height: 100, color: Colors.red),
        ],
      ),
    );
  }

  // LAB 3: IndexedStack (nhỏ)
  Widget indexedStackLab() {
    return const Center(
      child: Text(
        'IndexedStack\nGiữ trạng thái widget',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  // LAB 4: Spacer
  Widget spacerLab() {
    return Column(
      children: const [
        Spacer(),
        Text('Trên'),
        Spacer(),
        Text('Giữa'),
        Spacer(),
        Text('Dưới'),
        Spacer(),
      ],
    );
  }

  // LAB 5: Expanded
  Widget expandedLab() {
    return Column(
      children: [
        Expanded(flex: 1, child: Container(color: Colors.red)),
        Expanded(flex: 2, child: Container(color: Colors.green)),
        Expanded(flex: 1, child: Container(color: Colors.blue)),
      ],
    );
  }

  // LAB 6: SizedBox
  Widget sizedBoxLab() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [Text('Trên'), SizedBox(height: 30), Text('Dưới')],
      ),
    );
  }

  // LAB 7: Tween Animation
  Widget tweenLab() {
    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 200),
        duration: const Duration(seconds: 2),
        builder: (context, value, child) {
          return Container(width: value, height: value, color: Colors.purple);
        },
      ),
    );
  }

  // LAB 8: Scaffold (minh họa)
  Widget scaffoldLab() {
    return const Center(
      child: Text(
        'Scaffold\nKhung giao diện chính',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  // LAB 9: AppBar
  Widget appBarLab() {
    return const Center(
      child: Text('AppBar\nThanh tiêu đề', style: TextStyle(fontSize: 24)),
    );
  }

  // LAB 10: BottomAppBar
  Widget bottomAppBarLab() {
    return const Center(
      child: Text(
        'BottomAppBar\nThanh điều hướng dưới',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
