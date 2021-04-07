import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeBottom extends StatelessWidget {
  final Function onPressed;
  HomeBottom({
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: RawMaterialButton(
            onPressed: onPressed,
            shape: CircleBorder(),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 48.0,
            ),
            fillColor: Colors.teal,
            constraints: BoxConstraints.tightFor(width: 76.0, height: 76.0),
          ),
        ),
      ],
    );
  }
}
