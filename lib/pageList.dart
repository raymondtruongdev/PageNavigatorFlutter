import 'package:flutter/material.dart';
import 'package:watchface_plugin/page_tpl.dart';
import 'package:loop_page_view/loop_page_view.dart';

class PageList extends StatefulWidget {
  const PageList({Key? key}) : super(key: key);

  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    createPages();
  }

  void createPages() {
    pages = [
      const PageTemplate(
          mychild: TextCustomSquare(text: 'ITEM1', color: Colors.red)),
      const PageTemplate(
          mychild: TextCustomSquare(text: 'ITEM2', color: Colors.green)),
      const PageTemplate(
          mychild: TextCustomSquare(text: 'ITEM3', color: Colors.blue)),
      PageTemplate(
        mychild: AddNewPage(
          text: 'ITEM4',
          color: Colors.grey,
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
        mychild: TextCustomSquare(
            text: 'NEW ITEM (${pages.length + 1})', color: Colors.orange),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoopPageView.builder(
        controller: LoopPageController(initialPage: 0),
        scrollDirection: Axis.vertical,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
