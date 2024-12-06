import 'package:flutter/material.dart';
import 'package:workout_planner_v81/data/user_data.dart';
import 'package:workout_planner_v81/model/equipment_model.dart';
import 'package:workout_planner_v81/model/exercise_model.dart';
import 'package:workout_planner_v81/utils/colors.dart';
import 'package:workout_planner_v81/widgets/custom_sized_box.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final userData = user;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, ${userData.fullName}",
                  style: const TextStyle(
                    color: black,
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const CustomSizedBox1(),
                const Text(
                  "Lets Add Some Workouts and Equipment for today!",
                  style: TextStyle(
                    color: lightBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const CustomSizedBox1(),
                const Text(
                  "All Favorite Exercises",
                  style: TextStyle(
                    color: black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 4 / 5,
                  ),
                  itemCount: userData.favoriteExerciseList.length,
                  itemBuilder: (contex, index) {
                    Exercise favExercise = userData.favoriteExerciseList[index];
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            favExercise.exerciseName,
                            style: const TextStyle(
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.asset(
                            favExercise.exerciseImageUrl,
                            width: 100,
                          ),
                          Text(
                            "${favExercise.noOfMinutes.toString()} Minutes",
                            style: const TextStyle(
                              color: gray,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.favorite,
                              color: red,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                const CustomSizedBox2(),
                const Text(
                  "All Favorite Equipment",
                  style: TextStyle(
                    color: black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 4 / 5,
                  ),
                  itemCount: userData.favoriteEquipmentList.length,
                  itemBuilder: (contex, index) {
                    Equipment favEquipment =
                        userData.favoriteEquipmentList[index];
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            favEquipment.equipmentName,
                            style: const TextStyle(
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.asset(
                            favEquipment.equipmentImageUrl,
                            width: 100,
                          ),
                          Text(
                            "${favEquipment.noOfMinutes.toString()} Minutes",
                            style: const TextStyle(
                              color: gray,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.favorite,
                              color: red,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
