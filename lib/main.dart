import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late Animation<Offset> _animation1;

  late AnimationController _controller2;
  late Animation<Offset> _animation2;

  @override
  void initState() {
    super.initState();

    // Carré 1
    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation1 = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller1,
      curve: Curves.easeInOut,
    ));

    // Carré 2
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation2 = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(0.0, 1.0),
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.easeInOut,
    ));

    // Pour répéter les anims
    _controller1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller1.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller1.forward();
      }
    });

    _controller2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller2.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller2.forward();
      }
    });

    _controller1.forward();
    _controller2.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations de déplacement'),
      ),
      body: Center(
        child: Stack(
          children: [
            // Carré 1
            SlideTransition(
              position: _animation1,
              child: Container(
                width: 50.0,
                height: 50.0,
                color: Colors.red,
              ),
            ),
            // Carré 2
            SlideTransition(
              position: _animation2,
              child: Container(
                width: 50.0,
                height: 50.0,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }
}
