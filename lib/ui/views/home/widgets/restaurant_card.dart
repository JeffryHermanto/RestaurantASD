import 'package:flutter/material.dart';

import '../../../../datamodels/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({
    Key key,
    @required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: SizedBox(
              height: 77.0,
              width: 77.0,
              child: Image.asset(restaurant.image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 24.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff383838),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Rating: ${restaurant.rating}',
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff383838),
                  ),
                ),
                const SizedBox(height: 6.22),
                SizedBox(
                  height: 30.0,
                  width: double.infinity,
                  child: OutlineButton(
                    color: Colors.amber,
                    onPressed: () {},
                    child: const Text('Lihat Detail'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
