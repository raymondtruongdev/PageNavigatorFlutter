import 'package:flutter/material.dart';
import 'package:watchface_plugin/pageList.dart';
import 'package:watchface_plugin/page_tpl.dart';
import 'package:loop_page_view/loop_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ScrollConfiguration Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    createPages();
  }

  void createPages() {
    pages = [
      const PageTemplate(
          mychild: TextCustom(text: 'PAGE1', color: Colors.grey)),
      const PageTemplate(
          mychild: TextCustom(text: 'PAGE2', color: Colors.green)),
      const PageList(),
      PageTemplate(
        mychild: AddNewPage(
          text: 'PAGE4',
          color: Colors.white,
          onPressed: () {
            addPage();
          },
        ),
      ),
    ];
  }

  void addPage() {
    setState(() {
      pages.add(PageTemplate(
        mychild: TextCustom(
            text: 'NEW PAGE (${pages.length + 1})', color: Colors.orange),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoopPageView.builder(
        controller: LoopPageController(initialPage: 3),
        scrollDirection: Axis.horizontal,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
