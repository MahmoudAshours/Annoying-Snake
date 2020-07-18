import 'package:annoying_snake/Utils/egg.dart';
import 'package:annoying_snake/Utils/snake.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double dx = 0;
  double dy = 0;
  double snake_dx = 100;
  double snake_dy = 100;
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff002D00),
      body: Stack(
        children: [
          Positioned(
            top: dy,
            left: dx,
            child: Draggable(
              feedback: Egg(),
              affinity: Axis.horizontal,
              onDragStarted: () {
                _counter++;
                print(_counter);
              },
              onDragEnd: (details) {
                setState(() {
                  dx = details.offset.dx;
                  dy = details.offset.dy;
                  snake_dx = details.offset.dx;
                  snake_dy = details.offset.dy;
                });
              },
              childWhenDragging: SizedBox.shrink(),
              child: Egg(),
            ),
          ),
          AnimatedPositioned(
            left: snake_dx,
            top: snake_dy,
            onEnd: () {
              if (snake_dx == dx && snake_dy == dy) print('object');
            },
            child: Snake(),
            duration: Duration(seconds: 1),
          )
        ],
      ),
    );
  }
}
