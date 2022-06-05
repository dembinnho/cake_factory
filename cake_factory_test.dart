import './models/constants.dart';
import 'package:test/test.dart';
import 'cake_factory.dart';
import 'models/cake_ingredients.dart';

final CakeIngredients basicIngredientsForFrancComtoise = CakeIngredients(
    sugar: sugarFrancComtoise,
    butter: butterFrancComtoise,
    eggs: eggsFrancComtoise);
final CakeIngredients basicIngredientsForFrangipane = CakeIngredients(
    sugar: sugarFrangipane, butter: butterFrangipane, eggs: eggsFrangipane);

final CakeIngredients excessiveIngredientsForFrangipane = CakeIngredients(
    butter: butterFrangipane, sugar: sugarFrangipane + 1, eggs: eggsFrangipane);

final CakeIngredients excessiveIngredientsForFrancComtoise = CakeIngredients(
    butter: butterFrancComtoise,
    sugar: sugarFrancComtoise + 1,
    eggs: eggsFrancComtoise);

final CakeIngredients lessIngredientsForFrancComtoise = CakeIngredients(
    butter: butterFrancComtoise,
    sugar: sugarFrancComtoise - 1,
    eggs: eggsFrancComtoise);

final CakeIngredients lessIngredientsForFrangipane = CakeIngredients(
    butter: butterFrangipane, sugar: sugarFrangipane - 1, eggs: eggsFrangipane);

final CakeIngredients noIngredientsToCookAnyOfTheCake =
    CakeIngredients(butter: 0, sugar: 0, eggs: 0);
void main() {
  group("isCakeDoable (cas de base)", () {
    test("should return Franc Comtoise with these ingredients", () {
      // given
      basicIngredientsForFrancComtoise;
      //when
      final bool result = isFrancComtoise(basicIngredientsForFrancComtoise);
      //then
      expect(result, true, reason: "");
    });
    test("should return Frangipane with these ingredients", () {
      // given
      basicIngredientsForFrangipane;
      //when
      final bool result = isFrangipane(basicIngredientsForFrangipane);
      //then
      expect(result, true, reason: "");
    });
    test(
        "excessive amount of ingredients, should still return Franc comtoise (alternative case)",
        () {
      // given
      excessiveIngredientsForFrancComtoise;
      //when
      final bool result = isFrancComtoise(excessiveIngredientsForFrancComtoise);
      //then
      expect(result, true, reason: "");
    });
    test(
        "excessive amount of ingredients, should still return Frangipane (alternative case)",
        () {
      // given
      excessiveIngredientsForFrangipane;
      //when
      final bool result = isFrangipane(excessiveIngredientsForFrangipane);
      //then
      expect(result, true, reason: "");
    });
    group("Good ingredients with shape", () {
      test(
          "Good Ingredients for Franc comtoise and good shape to make it, should return franc comptoise",
          () {
        // given
        basicIngredientsForFrancComtoise;
        shapeFrancComtoise;
        //when
        final result = isFrancComtoiseDoable(basicIngredientsForFrancComtoise,
            shapeFrancComtoise); // change this function
        //then
        expect(result, true, reason: "");
      });
      test(
          "Good Ingredients for frangipane and good shape to make it, should return frangipane",
          () {
        // given
        basicIngredientsForFrangipane;
        shapeFrangipane;
        //when
        final result =
            isFrangipaneDoable(basicIngredientsForFrangipane, shapeFrangipane);
        //then
        expect(result, true, reason: "");
      });
    });
  });

  group("Error type", () {
    test("not enough ingredients to make Franc Comtoise", () {
      //given
      lessIngredientsForFrancComtoise;
      // when
      final result = isFrancComtoise(lessIngredientsForFrancComtoise);
      //then
      expect(result, false, reason: "");
    });
    test("not enough ingredients to make Frangipane", () {
      //given
      lessIngredientsForFrangipane;
      // when
      final result = isFrangipane(lessIngredientsForFrangipane);
      //then
      expect(result, false, reason: "");
    });
    test("not enough ingredients to make any of the recipes", () {
      //given
      lessIngredientsForFrancComtoise;
      // when
      final bool result = isFrangipane(lessIngredientsForFrancComtoise) &&
          isFrancComtoise(lessIngredientsForFrancComtoise);
      expect(result, false, reason: "");
    });
    test(
        "Good Ingredients for Franc comtoise and not a correct shape to make it",
        () {
      // given
      final CakeIngredients cakeIngredient = CakeIngredients(
          sugar: sugarFrancComtoise + 1,
          butter: butterFrancComtoise,
          eggs: eggsFrancComtoise);
      final shape = shapeFrancComtoise + 1;
      //when
      final result = isFrancComtoiseDoable(cakeIngredient, shape);
      //then
      expect(result, false, reason: "");
    });
    test("Good Ingredients for Frangipane and not a correct shape to make it",
        () {
      // given
      final CakeIngredients cakeIngredient = CakeIngredients(
          sugar: sugarFrangipane + 1,
          butter: butterFrangipane,
          eggs: eggsFrangipane);
      final shape = shapeFrangipane + 1;
      //when
      final result = isFrangipaneDoable(cakeIngredient, shape);
      //then
      expect(result, false, reason: "");
    });
  });

  /* group("Cooking test", () {
    test("Frangipane should be overcooked", () {
      //given
      int cooking = overcookedFrangipane;
      // when
      final result = cookingFrangipane(cooking);
      //then
      expect(result, "overcooked");
    });
    test("Frangipane should be well cooked", () {
      //given
      int cooking = wellCookedFrangipane;
      // when
      final result = cookingFrangipane(cooking);
      //then
      expect(result, "well cooked");
    });
    test("Franc comtoise should be overcooked", () {
      //given
      int cooking = overcookedFrancComtoise;
      // when
      final result = cookingFrancComtoise(cooking);
      //then
      expect(result, "overcooked");
    });
    test("Franc Comtoise should be well cooked", () {
      //given
      int cooking = wellCookedFrangipane;
      // when
      final result = cookingFrangipane(cooking);
      //then
      expect(result, "well cooked");
    });
  });
  group("Price test", () {
    test("Overcooked Frangipane shoud have a price of 0 euro", () {
      //given
      int cooking = overcookedFrangipane;

      //when
      int price = getFrangipanePrice(cooking);
      //then
      expect(price, 0);
    });
    test("Overcooked Franc Comtoise shoud have a price of 0 euro", () {
      //given
      int cooking = overcookedFrancComtoise;

      //when
      int price = getFrancComtoisePrice(cooking);
      //then
      expect(price, 0);
    });
    test("Well cooked Frangipane shoud have a price of 9 euros", () {
      //given
      int cooking = wellCookedFrangipane;

      //when
      int price = getFrangipanePrice(cooking);
      //then
      expect(price, 9);
    });
    test("Well cooked Franc Comtoise shoud have a price of 8 euros", () {
      //given
      int cooking = wellCookedFrancComtoise;

      //when
      int price = getFrancComtoisePrice(cooking);
      //then
      expect(price, 8);
    });
    group("error because of an out-of-range ", () {
      test("out-of-range cooking for frangipane", () {
        //given
        int cooking = outOfRangeCookingFrangipane;
        // when
        int price = getFrangipanePrice(cooking);
        //then
        expect(price, -1);
      });
      test("out-of-range cooking for Franc Comtoise", () {
        //given
        int cooking = outOfRangeCookingFrancComtoise;
        // when
        int price = getFrancComtoisePrice(cooking);
        //then
        expect(price, -1);
      });
    });
  }); */
}
