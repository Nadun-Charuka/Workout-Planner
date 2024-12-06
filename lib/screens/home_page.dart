import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_v81/data/equipment_data.dart';
import 'package:workout_planner_v81/data/exercise_data.dart';
import 'package:workout_planner_v81/data/user_data.dart';
import 'package:workout_planner_v81/screens/equipment_details_page.dart';
import 'package:workout_planner_v81/screens/exercise_details_page.dart';
import 'package:workout_planner_v81/utils/colors.dart';
import 'package:workout_planner_v81/widgets/custom_sized_box.dart';
import 'package:workout_planner_v81/widgets/exercise_card.dart';
import 'package:workout_planner_v81/widgets/progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  user.fullName,
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
                const Text(
                  "Today’s Activity",
                  style: TextStyle(
                    color: black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const CustomSizedBox1(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              title: 'Warmups',
                              description:
                                  'Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you\'re seeking the tranquility visit offers something for every traveler.',
                              exerciseList: exerciselist,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                        title: 'WarmUp',
                        description: 'see more',
                        imageUrl: "assets/images/exercises/cobra.png",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EquipmentDetailsPage(
                              title: "Equipment",
                              description:
                                  'Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you\'re seeking the tranquility visit offers something for every traveler.',
                              equipmentList: equipmentlist,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                        title: 'Equipment',
                        description: 'see more',
                        imageUrl: "assets/images/equipments/calendar.png",
                      ),
                    ),
                  ],
                ),
                const CustomSizedBox2(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              title: 'Exercise',
                              description:
                                  'Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you\'re seeking the tranquility visit offers something for every traveler.',
                              exerciseList: exerciselist,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                        title: 'Exercise',
                        description: 'see more',
                        imageUrl: "assets/images/exercises/dragging.png",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              title: 'Stretching',
                              description:
                                  'Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you\'re seeking the tranquility visit offers something for every traveler.',
                              exerciseList: exerciselist,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                        title: 'Stretching',
                        description: 'see more',
                        imageUrl: "assets/images/exercises/hunch_back.png",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
