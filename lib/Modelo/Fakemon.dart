import 'dart:math';

import 'package:fakemon2/Modelo/tiposPokemon.dart';

import 'package:flutter/cupertino.dart';

import 'AttackStrategy.dart';
import 'Estados.dart';
// Creamos una clase que representa un ataque
class Attack {
  final String name;

  final AttackStrategy strategy;

  Attack({required this.name, required this.strategy});
}

// La clase Fakemon utiliza una lista de ataques
class Fakemon extends ChangeNotifier {
  final String name;
  final PokemonType type;
   int defensa;
   int strong;
   int hp;
   int speed;
  final List<Attack> attacks;
  late Set<Estado> estados;
   bool estaDormido=false;
  bool estaParalizado=false;
  bool estaConfundido=false;

  Fakemon (
      {required this.strong,
      required this.speed,
      required this.name,
      required this.type,
      required this.defensa,
      required this.hp,
      required this.attacks
      });

  String attack(Fakemon opponent, int attackIndex) {
    // Verificamos que el índice del ataque sea válido
    if (attackIndex < 0 || attackIndex >= attacks.length) {
      throw ArgumentError('Invalid attack index');
    }

    int vidaInicial=opponent.hp;

    // Obtenemos el ataque correspondiente al índice y lo usamos
    var attack = attacks[attackIndex];
    attack.strategy.attack(this, opponent);

    return '$name uso ${attack.name} sobre ${opponent.name}. Este perdio ${vidaInicial-opponent.hp} puntos de vida';

  }

  void takeDamage(int damage) {


    //exponencial negativa,
    // reduce en 0% para una defensa de 0,
    // 63% para una defensa de 100
    // y 99% para una defensa de 500

    damage= damage*pow(e,(-defensa/100))as int;
    hp -= damage;
    if (hp < 0) {
      hp = 0;
    }

  notifyListeners();

  }

  void takeCuracion(int curacion){
    hp+= curacion;
  }

  void cambiarAtaque (double proporcion){
    strong=((strong as double) *proporcion) as int;
  }

  void cambiarVelocidad (double proporcion){
    speed=((speed as double) *proporcion) as int;
  }

  void cambiarDefensa (double proporcion){
    defensa=((defensa as double) *proporcion) as int;
  }

  void agregarEstado(Estado estado){
    estados.add(estado);
  }

  void quitarEstado(Estado estado){
   estados.remove(estado);
  }



  bool isFainted() {
    return hp == 0;
  }
}

