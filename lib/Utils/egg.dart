import 'package:flutter/material.dart';

class Egg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/egg.png'),
        ),
      ),
    );
  }
}
