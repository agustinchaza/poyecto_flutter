import 'package:get/get.dart';

import 'Fakemon.dart';
import 'tiposPokemon.dart';

import 'dart:math';


class ControllerBatalla extends GetxController  {


  RxString narradorDeBatalla = 'La batalla esta x comenzar'.obs;

  RxBool turnoJugador = true.obs;


  //inicializacion por defecto, los valores deben ser cargados al iniciar la batalla
  Rx <Fakemon> fakemonJugador = Fakemon(
    strong: 100,
    speed: 100,
    name: 'Charmander',
    type: PokemonType.fire,
    defensa: 100,
    hp: 100,
    attacks: [],
  ).obs;

  Rx <Fakemon> fakemonCPU = Fakemon(
    strong: 100,
    speed: 100,
    name: 'Charmander',
    type: PokemonType.fire,
    defensa: 100,
    hp: 100,
    attacks: [],
  ).obs;




  setFakemons(Fakemon fakemonJugador, Fakemon fakemonCPU){
    this.fakemonJugador.value = fakemonJugador;
    this.fakemonCPU.value = fakemonCPU;

  }

  getAcciones(int indexAttack){

    if(!comprobarDebilitaciones(fakemonJugador.value)){
      narradorDeBatalla.value = fakemonJugador.value.attack(fakemonCPU.value, indexAttack);
    }
  }


  ataqueCPU(){

    if(!comprobarDebilitaciones(fakemonJugador.value)){

      var rng = new Random();
      int indexAttack = rng.nextInt(fakemonCPU.value.attacks.length);
      narradorDeBatalla.value = fakemonCPU.value.attack(fakemonJugador.value, indexAttack);

    }

  }


  bool comprobarDebilitaciones(Fakemon fakemon){
    if(fakemonJugador.value.estaConfundido){
      narradorDeBatalla.value =  'El fakemon ${fakemon.name} esta confundido y no puede atacar';
      return true;
    }
    else if(fakemonJugador.value.estaParalizado){
      narradorDeBatalla.value =  'El fakemon ${fakemon.name} esta paralizado y no puede atacar';
      return true;
    }
    else if(fakemonJugador.value.estaDormido){
      narradorDeBatalla.value =  'El fakemon ${fakemon.name} esta dormido y no puede atacar';
      return true;
    }

    return false;
  }










  bool comprobarVida(){
    if(fakemonJugador.value.hp <= 0){
      narradorDeBatalla.value = 'el Fakemon ${fakemonJugador.value.name} se debilito y a perdido la batalla. ${fakemonCPU.value.name} es el ganador!';
      return true;
    }
    else if(fakemonCPU.value.hp <= 0){
      narradorDeBatalla.value = 'el Fakemon ${fakemonCPU.value.name} se debilito y a perdido la batalla. ${fakemonJugador.value.name} es el ganador!';
      return true;
    }
    return false;
  }






  flujoDeBatalla() {




    while (true) {


      fakemonJugador.value.speed > fakemonCPU.value.speed   ?    turnoJugador.value = true  :  turnoJugador.value = false;


      if (turnoJugador.value) {

        turnoPlayer();
        if(comprobarVida()) break ;

        turnoCPU();
        if(comprobarVida()) break ;

      }


      else {

        turnoCPU();
        if(comprobarVida()) break ;

        turnoPlayer();
        if(comprobarVida()) break ;
      }



      for (var estado in fakemonJugador.value.estados) {
        estado.actuar();
        //TODO: esperar a recibir un stream de la vista
        if(comprobarVida()) break ;
      }

      if(comprobarVida()) break ;

      for (var estado in fakemonCPU.value.estados) {
        estado.actuar();
        //TODO: esperar a recibir un stream de la vista
        if(comprobarVida()) break ;
      }

      if(comprobarVida()) break ;




    }

  }



  void turnoPlayer() {
    narradorDeBatalla.value = 'Es el turno de ${fakemonJugador.value.name}. Elije un ataque';
    int indexAttack=0 ;
    //TODO: esperar a recibir un stream de la vista con el indice de ataque

    getAcciones(indexAttack);

    //TODO: esperar a recibir un stream de la vista para poder continuar

  }

  void turnoCPU() {
    narradorDeBatalla.value = 'Es el turno de ${fakemonCPU.value.name}.';

    //TODO: esperar a recibir un stream de la vista para poder continuar

    ataqueCPU();

    //TODO: esperar a recibir un stream de la vista para poder continuar

  }








}



