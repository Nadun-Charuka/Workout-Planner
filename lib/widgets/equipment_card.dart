import 'package:flutter/material.dart';
import 'package:workout_planner_v81/utils/colors.dart';

class EquipmentCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String discription;
  final int noOfMinutes;
  final double noOfCalories;

  const EquipmentCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.discription,
    required this.noOfMinutes,
    required this.noOfCalories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: lightGray,
        boxShadow: const [
          BoxShadow(
            color: gray,
            offset: Offset(1, 1),
            blurRadius: 3,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 100,
                ),
                Text(
                  "$noOfMinutes mins of workout \n$noOfCalories Calories wiil burn",
                  style: const TextStyle(
                    color: lightBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              discription,
              style: const TextStyle(
                color: gray,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
