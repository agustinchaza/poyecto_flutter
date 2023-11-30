import 'package:flutter/material.dart';

import 'Menu_Inicial.dart';
import 'Navegador_de_Paginas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  bool _canPlay = false;
  Color _appBarColor = Colors.green;

  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(_controller)
      ..addListener(() {
        setState(() {_animation.addListener(() {
          setState(() {
            _appBarColor = _animation.value!;
          });
        });});
      });
  }

  void _changeAppBarColor() {
    _controller.forward(from: 0);
    Future.delayed(Duration(milliseconds: 500), () {
      _controller.reverse(from: 1);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _appBarColor,
        toolbarHeight: 28.0,
        title: Text(
          'Fakemon',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Navegador_de_Paginas()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _changeAppBarColor(),
        child: Icon(Icons.color_lens),
      ),
    );
  }
}
