import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 15),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transition"),),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child:
            SizedBox.expand(
              child: GestureDetector(
                onTap: () {
                  if (_animationController.isAnimating)
                    _animationController.stop();
                  else
                    _animationController.repeat();
                },
                child: Container(
                  color: Colors.black,
                ),
              )
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: RotationTransition(
              child: Image.asset('assets/images/galaxy.png',),
              alignment: Alignment.center,
              turns: _animationController,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}