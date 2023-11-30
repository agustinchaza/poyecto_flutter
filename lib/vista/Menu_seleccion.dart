import 'package:fakemon2/Modelo/RegistroJugador.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Menu_Inicial.dart';
//import 'package:grouped_buttons/grouped_buttons.dart';
const List<Widget> genero = <Widget>[
  Text('Chico'),
  Text('Chica'),

];


class Menu_seleccion extends StatefulWidget {

  static final Menu_seleccion _instance = Menu_seleccion._internal();

  factory Menu_seleccion() {
    return _instance;
  }

  Menu_seleccion._internal();

  @override
  _Menu_seleccionState createState() => _Menu_seleccionState();
}

class _Menu_seleccionState extends State<Menu_seleccion> with AutomaticKeepAliveClientMixin {




  @override
  bool get wantKeepAlive => true;

  String _gender='';
  String _profesion=RegistroJugador.profesion;

  final _textController=TextEditingController();
  late String nombreAux=RegistroJugador.nombre;
  late int edadAux=RegistroJugador.edad;
  List<bool> _selectedGenero = RegistroJugador.selectedGenero;



  @override
  Widget build(BuildContext context) {




    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Información personal',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nombre'),
                Container(
                  width: 150,
                  child: TextFormField(
                    //value=RegistroJugador.nombre,
                    onChanged: (value){
                      nombreAux=value;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      hintText: nombreAux,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text('Número'),
                Container(

                  child:Expanded(
                  child: TextFormField(
                    onChanged: (value){

                      edadAux=value as int;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: edadAux.toString(),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Género'),
                SizedBox(width: 20),
                Expanded(
                    child: ToggleButtons(
                        isSelected: _selectedGenero,
                        selectedColor: _selectedGenero[0] ? Colors.blue[300] : Colors.pink,
                        children: genero,
                        //selectedBorderColor: Colors.amber,
                        //color: Colors.amber,
                        fillColor: _selectedGenero[0] ? Colors.pink.withOpacity(0.30) :Colors.blue.withOpacity(0.3),
                        onPressed: (int index) {

                          // The button that is tapped is set to true, and the others to false.
                          for (int i = 0; i < _selectedGenero.length; i++) {

                            _selectedGenero[i] = i == index;
                          setState((){});
                          }}
                    )
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Ocupación'),
                SizedBox(width: 20),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value:_profesion ,
                    items: <String>[
                      'Estudiante',
                      'Profesor',
                      'Programador',
                      'Otro'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _profesion = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implementar lógica del botón


                    RegistroJugador.selectedGenero=_selectedGenero;
                    RegistroJugador.profesion=_profesion;
                    //print('holi');
                    RegistroJugador.nombre=nombreAux;
                    //print('holi');
                    RegistroJugador.edad=edadAux;




                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => Menu_Inicial(),
                    ),
                    );
                  },
                  child: Text('Volver'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}
