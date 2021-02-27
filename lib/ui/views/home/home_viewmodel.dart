import 'package:stacked/stacked.dart';

import '../../../datamodels/restaurant.dart';

class HomeViewModel extends BaseViewModel {
  final List<Restaurant> _restaurants = [
    Restaurant(
      name: 'Pada Senang',
      image: 'assets/restaurants/restaurant_1.jpg',
      rating: 5,
    ),
    Restaurant(
      name: 'Bumi Kiara',
      image: 'assets/restaurants/restaurant_2.jpg',
      rating: 3,
    ),
    Restaurant(
      name: 'Sederhana Sekali',
      image: 'assets/restaurants/restaurant_3.jpg',
      rating: 2,
    ),
    Restaurant(
      name: 'Ayam Goreng Jadoel',
      image: 'assets/restaurants/restaurant_4.jpg',
      rating: 4,
    ),
    Restaurant(
      name: 'Baso Pak Mario',
      image: 'assets/restaurants/restaurant_5.jpg',
      rating: 5,
    ),
    Restaurant(
      name: 'Soto Kubang',
      image: 'assets/restaurants/restaurant_6.jpg',
      rating: 2,
    ),
    Restaurant(
      name: 'Sate Joss',
      image: 'assets/restaurants/restaurant_7.jpg',
      rating: 4,
    ),
    Restaurant(
      name: 'Mie Gandul',
      image: 'assets/restaurants/restaurant_8.jpg',
      rating: 3,
    ),
  ];

  List<Restaurant> get restaurants => _restaurants;
}
