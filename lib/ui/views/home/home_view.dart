import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants.dart';
import 'home_viewmodel.dart';
import 'widgets/restaurant_card.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  Widget builder(BuildContext context, HomeViewModel model, Widget child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant ASD'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(28.0),
        children: [
          _buildHeader(),
          const SizedBox(height: 18.0),
          ListView.separated(
            shrinkWrap: true,
            itemCount: model.restaurants.length,
            itemBuilder: (context, index) =>
                RestaurantCard(restaurant: model.restaurants[index]),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(thickness: 1.5),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Text(
      'Restaurants',
      style: TextStyle(
        color: kSecondaryBlack,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }
}
