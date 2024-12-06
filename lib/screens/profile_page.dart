import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_v81/data/equipment_data.dart';
import 'package:workout_planner_v81/data/exercise_data.dart';
import 'package:workout_planner_v81/data/user_data.dart';
import 'package:workout_planner_v81/model/equipment_model.dart';
import 'package:workout_planner_v81/model/exercise_model.dart';
import 'package:workout_planner_v81/utils/colors.dart';
import 'package:workout_planner_v81/widgets/custom_sized_box.dart';
import 'package:workout_planner_v81/widgets/profile_card.dart';
import 'package:workout_planner_v81/widgets/progress_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //Date and Time formatters
  final DateFormat weekdayMonthFormatter = DateFormat("EEEE,MMMM");
  final DateFormat dayFormatter = DateFormat("dd");

  //user data
  final userData = user;

  //exercise and equipment data
  final exerciselist = ExerciseData().exerciseList;
  final equipmentlist = EquipmentData().equipmentList;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formettedMonth = weekdayMonthFormatter.format(now);
    String formattedDay = dayFormatter.format(now);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$formettedMonth $formattedDay",
                  style: const TextStyle(
                    color: gray,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  userData.fullName,
                  style: const TextStyle(
                    color: black,
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const CustomSizedBox1(),
                ProgressCard(
                  progressValue: userData.calculateTotalCaloriesBurned(),
                  total: 100,
                ),
                const CustomSizedBox1(),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: lightGray,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Minutes Spend: ${userData.calculateTotalMinutesSpent().toString()}",
                          style: const TextStyle(
                            color: blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const CustomSizedBox2(),
                        Text(
                          "Total Exercises Completed: ${userData.totalExerciseCompleted.toString()}",
                          style: const TextStyle(
                            color: black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Total Equipment Handovered : ${userData.totalEquipmentsHandOvered.toString()}",
                          style: const TextStyle(
                            color: black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const CustomSizedBox1(),
                const Text(
                  "Your Exercises",
                  style: TextStyle(
                    color: blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userData.exerciseList.length,
                  itemBuilder: (contex, index) {
                    Exercise exercise = userData.exerciseList[index];
                    return ProfileCard(
                      title: exercise.exerciseName,
                      imageUrl: exercise.exerciseImageUrl,
                      markAsDone: () {
                        setState(() {
                          userData.markExerciseAsCompleted(exercise.id);
                        });
                      },
                    );
                  },
                ),
                const CustomSizedBox2(),
                const Text(
                  "Your Equipment",
                  style: TextStyle(
                    color: blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userData.equipmentList.length,
                  itemBuilder: (contex, index) {
                    Equipment equipment = userData.equipmentList[index];
                    return ProfileCard(
                      title: equipment.equipmentName,
                      imageUrl: equipment.equipmentImageUrl,
                      markAsDone: () {
                        setState(() {
                          userData.markAshandovered(equipment.id);
                        });
                      },
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
