import 'dart:math';

import 'Fakemon.dart';

 abstract class Estado{

  late Fakemon fakemon;
   void actuar(){}
  void limpiar(){
    fakemon.quitarEstado(this);
  }
  void setPortador(Fakemon fakemon){
    this.fakemon=fakemon;
  }
}

class Dormir extends  Estado{
  @override
  void actuar() {
    if (Random().nextDouble() < 0.5 && fakemon.estaDormido==true){
      fakemon.estaDormido=false;
      limpiar();
    }
    else fakemon.estaDormido=true;
  }
}

class Paralizar extends Estado{
   @override
  void actuar(){
     if (Random().nextDouble() < 0.5 && fakemon.estaParalizado==true){
       fakemon.estaParalizado=false;
       limpiar();
     }
     else fakemon.estaParalizado=true;
   }
}

class Confundir extends Estado{
  @override
  void actuar(){
    if (Random().nextDouble() < 0.5 && fakemon.estaParalizado==true){
      fakemon.estaParalizado=false;
      limpiar();
    }
    else fakemon.estaParalizado=true;
  }
}

class Quemar extends Estado{

   late int ataqueQuitado;

   @override
  void actuar(){
     fakemon.takeDamage(fakemon.hp*0.125 as int);
   }

   @override
  void limpiar() {

    super.limpiar();
    double ataqueADevolver=(ataqueQuitado+fakemon.strong)/fakemon.strong;
    fakemon.cambiarAtaque(ataqueADevolver);
  }

  @override
  void setPortador(Fakemon fakemon){
    super.setPortador(fakemon);
    fakemon.cambiarAtaque(0.5);
    ataqueQuitado=fakemon.strong;
  }
}





