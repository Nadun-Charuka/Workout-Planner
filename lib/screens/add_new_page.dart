import 'package:flutter/material.dart';
import 'package:workout_planner_v81/data/equipment_data.dart';
import 'package:workout_planner_v81/data/exercise_data.dart';
import 'package:workout_planner_v81/data/user_data.dart';
import 'package:workout_planner_v81/model/equipment_model.dart';
import 'package:workout_planner_v81/model/exercise_model.dart';
import 'package:workout_planner_v81/utils/colors.dart';
import 'package:workout_planner_v81/widgets/add_equipment_card.dart';
import 'package:workout_planner_v81/widgets/add_exercise_card.dart';
import 'package:workout_planner_v81/widgets/custom_sized_box.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  final userData = user;
  final exerciseList = ExerciseData().exerciseList;
  final equipmentList = EquipmentData().equipmentList;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                  "All Exercises",
                  style: TextStyle(
                    color: black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const CustomSizedBox1(),
                SizedBox(
                  height: 270,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: exerciseList.length,
                    itemBuilder: (context, index) {
                      Exercise exercise = exerciseList[index];
                      return AddExerciseCard(
                        title: exercise.exerciseName,
                        imageUrl: exercise.exerciseImageUrl,
                        noOfMinutes: exercise.noOfMinutes,
                        toggleAddExercise: () {
                          setState(() {});
                          if (userData.exerciseList.contains(exercise)) {
                            userData.removeExercise(exercise);
                          } else {
                            userData.addExercise(exercise);
                          }
                        },
                        isAdd: userData.exerciseList.contains(exercise),
                        toggleAddFavoriteExercise: () {
                          setState(() {
                            if (userData.favoriteExerciseList
                                .contains(exercise)) {
                              userData.removeFavouriteExercise(exercise);
                            } else {
                              userData.addFavouriteExercise(exercise);
                            }
                          });
                        },
                        isFavorite:
                            userData.favoriteExerciseList.contains(exercise),
                      );
                    },
                  ),
                ),
                const CustomSizedBox2(),
                const Text(
                  "All Equipments",
                  style: TextStyle(
                    color: black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const CustomSizedBox1(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    itemCount: equipmentList.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      Equipment equipment = equipmentList[index];
                      return AddEquipmentCard(
                        title: equipment.equipmentName,
                        imageUrl: equipment.equipmentImageUrl,
                        discription: equipment.equipmentDescription,
                        noOfMinutes: equipment.noOfMinutes,
                        noOfCalories: equipment.noOfCalories,
                        isAdd: userData.equipmentList.contains(equipment),
                        toggleAddEquipment: () {
                          setState(() {
                            if (userData.equipmentList.contains(equipment)) {
                              userData.removeEquipment(equipment);
                            } else {
                              userData.addEquipment(equipment);
                            }
                          });
                        },
                        toggleAddFavoriteEquipment: () {
                          setState(() {
                            if (userData.favoriteEquipmentList
                                .contains(equipment)) {
                              userData.removeFavouriteEquipment(equipment);
                            } else {
                              userData.addFavouriteEquipment(equipment);
                            }
                          });
                        },
                        isFavorite:
                            userData.favoriteEquipmentList.contains(equipment),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
