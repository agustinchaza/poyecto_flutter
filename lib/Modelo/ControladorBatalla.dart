import 'package:flutter/material.dart';

import 'Fakemon.dart';

class ControladorBatalla {

  Fakemon player;
  Fakemon pc;

  ControladorBatalla(this.player, this.pc){
    player.addListener(actualizarValores);
    pc.addListener(actualizarValores);
  }


void actualizarValores(){
    //implementar
}

  void batallar() async{
    while(true){


      ingresarAtaque();
      //await continuar();
      int ataquePlayer=1;
      int ataquePC=1;

      if(player.speed> pc.speed){
        ejecutarAtaque(player, pc, ataquePlayer);
        ejecutarAtaque(pc, player, ataquePC);
      }else{
        ejecutarAtaque(pc, player, ataquePlayer);
        ejecutarAtaque(player, pc, ataquePC);
      }



      player.speed > pc.speed ?    ejecutarEstados(player,pc) :  ejecutarEstados(pc,player);
  }
}

void ejecutarEstados(Fakemon rapido, Fakemon lento){
    rapido.estados.forEach((element) {element.actuar();});
    lento.estados.forEach((element) {element.actuar();});
}

  void ingresarAtaque() {
    //implementarMetodo


  }

  void ejecutarAtaque(Fakemon fakemon, Fakemon oponente, int indexAtaque){

    if (fakemon.estaParalizado || fakemon.estaDormido || fakemon.estaConfundido){
      //implementar
    } else{
      fakemon.attack(oponente, indexAtaque);
    }
  }

}