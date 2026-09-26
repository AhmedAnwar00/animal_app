import 'package:animal_app/features/home/model/home_animal.dart';

class HomeController {
  const HomeController();

  List<HomeAnimal> get animals => _animals;

  static const _description =
      "I found this sweet dog and am looking for a loving home for them. If you're ready to welcome a new furry friend into your life, this adorable pup is waiting to bring joy and...";

  static const _animals = [
    HomeAnimal(
      name: 'Dog name',
      creator: 'create by Ahmed El-said',
      price: '1000\$',
      description: _description,
    ),
    HomeAnimal(
      name: 'Dog name',
      creator: 'create by Ahmed El-said',
      price: '1000\$',
      description: _description,
    ),
  ];
}
