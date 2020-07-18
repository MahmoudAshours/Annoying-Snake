import 'package:flutter/cupertino.dart';

class Snake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage('snake.gif'))),
    );
  }
}
