import 'package:flutter/material.dart';
import 'package:scroll_snap_lint_demo/vertical_list.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'graph_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(title: 'Flutter Demo Home Page'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScrollSnapListState> sslKey = GlobalKey();
  List<int> data = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    0,
    11,
    22,
    33,
    44,
    55,
    66,
    77,
    88,
    99
  ];

  Widget _buildListItem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 350,
      child: Material(
        color: Colors.lightBlueAccent,
        child: Text("Child index $index"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerticalListDemo()));
              },
              icon: Icon(Icons.navigate_next)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HorizontalListDemo()));
              },
              icon: Icon(Icons.navigate_next)),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: ScrollSnapList(
              margin: const EdgeInsets.symmetric(vertical: 10),
              itemSize: 360,
              itemBuilder: _buildListItem,
              itemCount: data.length,
              key: sslKey,
              onItemFocus: (int i) {},
            ),
          ),
        ],
      ),
    );
  }
}
