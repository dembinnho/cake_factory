import 'dart:math';
import './models/cake_ingredients.dart';
import './models/cake.dart';
import './models/constants.dart';

bool isFrancComtoise(CakeIngredients ingredients) {
  return (ingredients.sugar >= sugarFrancComtoise &&
      ingredients.butter >= butterFrancComtoise &&
      ingredients.eggs >= eggsFrancComtoise);
}

bool isFrancComtoiseShape(int shape) {
  return shape == shapeFrancComtoise;
}

bool isFrancComtoiseDoable(CakeIngredients ingredients, int shape) {
  return isFrancComtoise(ingredients) && isFrancComtoiseShape(shape);
}

bool isFrangipane(CakeIngredients ingredients) {
  return (ingredients.sugar >= sugarFrangipane &&
      ingredients.butter >= butterFrangipane &&
      ingredients.eggs >= eggsFrangipane);
}

bool isFrangipaneShape(int shape) {
  return shape == shapeFrangipane;
}

bool isFrangipaneDoable(CakeIngredients ingredients, int shape) {
  return isFrangipaneShape(shape) && isFrangipane(ingredients);
}

int randomGenerator(int max) {
  Random generator = Random();
  return generator.nextInt(max);
}

String getCakeType(shape) {
  if (shape == shapeFrangipane) {
    return "Frangipane";
  }
  if (shape == shapeFrancComtoise) {
    return "Franc Comtoise";
  }
  return "No type of cake";
}

int getCakePrice(String name) {
  switch (name) {
    case "Frangipane":
      return frangipanePrice;
    case "Franc Comtoise":
      return francComtoisePrice;
    default:
      return errorPrice; // on entre jamais ici
  }
}

String cooking(String cakeType) {
  Random generator = Random();
  int cooking = 10;
  switch (cakeType) {
    case "Frangipane":
      cooking = generator.nextInt(frangipaneProbabilityCooking);
      break;
    case "Franc comtoise":
      cooking = generator.nextInt(francComtoiseProbabilityCooking);
      break;
    case "error":
      return "";
  }
  return cooking == 0 ? "overcooked" : "well cooked";
}

void makeCake(Cake cake) {
  String type = getCakeType(cake.shape);
  bool able;
  print("first step");
  print(cakeDisp(cake));
  switch (type) {
    case "Frangipane":
      cake.cakeType = "Frangipane";
      able = isFrangipane(cake.cakeIngredients);
      break;
    case "Franc Comtoise":
      cake.cakeType = "Franc Comtoise";
      able = isFrancComtoise(cake.cakeIngredients);
      break;
    default:
      print("second step");
      cake.cakeType = "Not any type";
      return;
  }
  print("second step");
  if (!able) {
    String oldType = cake.cakeType;
    cake.cakeType = "Not enough ingredients to make " + oldType + " abort";
    print(cakeDisp(cake));
    return;
  }
  print(cakeDisp(cake));
  String cookingWay = cooking(cake.cakeType);
  print("third step");
  switch (cookingWay) {
    case "overcooked":
      cake.cooked = cookingWay;
      // print(cakeDisp(cake));
      break;
    // return;
    case "well cooked":
      cake.cooked = cookingWay;
      break;
    default:
      cake.cooked = "Error at this step";
      print(cakeDisp(cake));
      return;
  }
  //une liste de cake step qu'on peut imprimer si l'on veut
  // TDD dabord on fonce apres on retravaille le code tout en s'assurant que les tests passent toujours

  print(cakeDisp(cake));
  if (cookingWay == "overcooked") {
    print("cake is overcooked, error at third step");
    return;
  }
  cake.price = getCakePrice(cake.cakeType);
  print("last step");
  print(cakeDisp(cake));
}

Map cakeDisp(Cake cake) {
  return {
    "shape": cake.shape,
    "cakeType": cake.cakeType,
    "cooking": cake.cooked,
    "price": cake.price,
  };
}
