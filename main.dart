import './models/cake.dart';
import './cake_factory.dart';
import './models/cake_ingredients.dart';
import './models/constants.dart';

void main() {
  CakeIngredients ingredientsForFrangipane =
      CakeIngredients(butter: 75, sugar: 100, eggs: 2);
  makeCake(
      Cake(cakeIngredients: ingredientsForFrangipane, shape: shapeFrangipane));
  CakeIngredients(sugar: 100, butter: butterFrancComtoise, eggs: 4);
  final CakeIngredients basicIngredientsForFrancComtoise = CakeIngredients(
      sugar: sugarFrancComtoise,
      butter: butterFrancComtoise,
      eggs: eggsFrancComtoise);
  final CakeIngredients basicIngredientsForFrangipane = CakeIngredients(
      sugar: sugarFrangipane, butter: butterFrangipane, eggs: eggsFrangipane);

  final CakeIngredients excessiveIngredientsForFrangipane = CakeIngredients(
      butter: butterFrangipane,
      sugar: sugarFrangipane + 1,
      eggs: eggsFrangipane);

  final CakeIngredients excessiveIngredientsForFrancComtoise = CakeIngredients(
      butter: butterFrancComtoise,
      sugar: sugarFrancComtoise + 1,
      eggs: eggsFrancComtoise);

  final CakeIngredients lessIngredientsForFrancComtoise = CakeIngredients(
      butter: butterFrancComtoise,
      sugar: sugarFrancComtoise - 1,
      eggs: eggsFrancComtoise);

  final CakeIngredients lessIngredientsForFrangipane = CakeIngredients(
      butter: butterFrangipane,
      sugar: sugarFrangipane - 1,
      eggs: eggsFrangipane);

  final CakeIngredients noIngredientsToCookAnyOfTheCake =
      CakeIngredients(butter: 0, sugar: 0, eggs: 0);
  List<Cake> cakes = [
    Cake(cakeIngredients: ingredientsForFrangipane, shape: shapeFrangipane),
    Cake(
        cakeIngredients: basicIngredientsForFrangipane,
        shape: shapeFrancComtoise),
    Cake(
        cakeIngredients: excessiveIngredientsForFrancComtoise,
        shape: shapeFrangipane),
    Cake(
        cakeIngredients: excessiveIngredientsForFrancComtoise,
        shape: shapeFrancComtoise),
    Cake(
        cakeIngredients: excessiveIngredientsForFrangipane,
        shape: shapeFrangipane),
    Cake(
        cakeIngredients: basicIngredientsForFrancComtoise,
        shape: shapeFrancComtoise),
    Cake(
        cakeIngredients: basicIngredientsForFrancComtoise,
        shape: shapeFrangipane),
    Cake(
        cakeIngredients: lessIngredientsForFrancComtoise,
        shape: shapeFrancComtoise),
    Cake(
        cakeIngredients: lessIngredientsForFrancComtoise,
        shape: shapeFrangipane),
    Cake(cakeIngredients: lessIngredientsForFrangipane, shape: shapeFrangipane),
    Cake(
        cakeIngredients: lessIngredientsForFrangipane,
        shape: shapeFrancComtoise),
    Cake(
        cakeIngredients: noIngredientsToCookAnyOfTheCake,
        shape: shapeFrangipane),
    Cake(
        cakeIngredients: noIngredientsToCookAnyOfTheCake,
        shape: shapeFrancComtoise),
  ];
  Cake nocake = Cake(
      cakeIngredients: noIngredientsToCookAnyOfTheCake,
      shape: shapeFrancComtoise);
  makeCake(nocake);
  print(cakes.map((e) => makeCake(e)));
}
