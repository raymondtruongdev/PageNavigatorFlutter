import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final Widget mychild;

  // Constructor
  const PageTemplate({Key? key, required this.mychild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxScreen = 384;
    double widthScreen = MediaQuery.of(context).size.width;
    double watchSize = widthScreen.clamp(0, maxScreen);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ClipOval(
          child: SizedBox(
            width: watchSize,
            height: watchSize,
            child: mychild,
          ),
        ),
      ),
    );
  }
}

class TextCustom extends StatelessWidget {
  final String text;
  final Color color;
  const TextCustom({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: color,
            child: Center(
                child:
                    Text(text, style: const TextStyle(color: Colors.black)))),
      ),
    );
  }
}

class TextCustomSquare extends StatelessWidget {
  final String text;
  final Color color;
  const TextCustomSquare({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Center(
            child: Container(
              width: 200,
              height: 200,
              color: color,
              child: Center(
                  child:
                      Text(text, style: const TextStyle(color: Colors.black))),
            ),
          )),
    );
  }
}

class AddNewPage extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  const AddNewPage(
      {Key? key,
      required this.text,
      required this.color,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: color,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(text,
                          style: const TextStyle(color: Colors.black))),
                  const SizedBox(height: 30),
                  Center(
                      child: ElevatedButton(
                    onPressed: () {
                      onPressed();
                    },
                    child: const Text('Enabled'),
                  ))
                ],
              ),
            )),
      ),
    );
  }
}
