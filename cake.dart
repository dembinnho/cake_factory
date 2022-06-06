import 'cake_ingredients.dart';

class Cake {
  CakeIngredients cakeIngredients =
      CakeIngredients(sugar: 0, butter: 0, eggs: 0);
  int shape = 0;
  String cakeType = "Not defined yet";
  int price = 0;
  String cooked = "Not defined yet";
  Cake({required this.cakeIngredients, required this.shape});
}
