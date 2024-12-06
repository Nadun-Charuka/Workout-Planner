import 'package:flutter/material.dart';
import 'package:workout_planner_v81/utils/colors.dart';

class AddExerciseCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int noOfMinutes;
  final bool isAdd;
  final bool isFavorite;
  final void Function() toggleAddExercise;
  final void Function() toggleAddFavoriteExercise;

  const AddExerciseCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.noOfMinutes,
    required this.toggleAddExercise,
    required this.isAdd,
    required this.toggleAddFavoriteExercise,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.3,
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              imageUrl,
              scale: 5,
              fit: BoxFit.cover,
            ),
            Text(
              "$noOfMinutes minutes",
              style: const TextStyle(
                color: gray,
                fontSize: 15,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: gray,
                  ),
                  child: IconButton(
                    color: blue,
                    onPressed: () {
                      toggleAddExercise();
                    },
                    icon: Icon(
                      isAdd ? Icons.remove : Icons.add,
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: gray,
                  ),
                  child: IconButton(
                    color: red,
                    iconSize: 30,
                    onPressed: () {
                      toggleAddFavoriteExercise();
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
