import 'package:annoying_snake/Utils/egg.dart';
import 'package:annoying_snake/Utils/snake.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double dx = 0;
  double dy = 0;
  double snakedx = 100;
  double snakedy = 100;
  int _counter = 0;
  AudioCache player;
  
  @override
  void initState() {
    player = AudioCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff002D00),
      body: Stack(
        children: [
          AnimatedPositioned(
            left: snakedx,
            top: snakedy,
            onEnd: () {
              if (snakedx == dx && snakedy == dy - 40) print('object');
            },
            child: Snake(),
            duration: Duration(seconds: 1),
          ),
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
                  snakedx = details.offset.dx;
                  snakedy = details.offset.dy - 40;
                });
              },
              childWhenDragging: SizedBox.shrink(),
              child: Egg(),
            ),
          ),
        ],
      ),
    );
  }
}
