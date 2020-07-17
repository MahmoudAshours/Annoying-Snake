import 'package:annoying_snake/Utils/egg.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Draggable(
            feedback: Egg(),
            childWhenDragging:SizedBox.shrink(),
            child: Egg(),
          )
        ],
      ),
    );
  }
}
