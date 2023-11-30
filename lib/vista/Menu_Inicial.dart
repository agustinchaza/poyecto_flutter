
//import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';

import 'Menu_seleccion.dart';

class Menu_Inicial extends StatelessWidget {
  static final Menu_Inicial _instance = Menu_Inicial._internal();

  factory Menu_Inicial() {
    return _instance;
  }

  Menu_Inicial._internal();





  bool _canPlay = true ;

  @override
  Widget build(BuildContext context) {
    return

           Center(
            child:Column( mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 6,
                    child: Container()),
            Expanded(
              flex:3,
              child:
            Transform.scale(
            scale: 0.8,
            child: Container(
            decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
            ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(flex:1, child: Container()),
                Expanded(
                  flex: MediaQuery.of(context).orientation == Orientation.portrait ? 3 : 1,
                  child: ElevatedButton.icon(
                  onPressed: _canPlay
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Menu_seleccion(),
                      ),
                    );
                  }
                      : null,
                  icon: Icon(Icons.play_arrow_outlined, color: Colors.yellow),
                  label: Text(''),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    minimumSize: Size(130, 50),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                ),
                Expanded(flex:2, child: Container()),
                Expanded(
                  flex: MediaQuery.of(context).orientation == Orientation.portrait ? 3 : 1,
                  child:  ElevatedButton.icon(
                  onPressed: () {},
                    icon: Icon(Icons.settings_outlined, color: Colors.yellow),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(130, 50),
                  ), label: Text(''),
                ),
                ),
                Expanded(flex:1,  child: Container()),
              ],
            ),
            ),
            ),
            ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
          );


    ;
  }



}
