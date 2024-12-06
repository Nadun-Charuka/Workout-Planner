import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_v81/model/exercise_model.dart';
import 'package:workout_planner_v81/utils/colors.dart';
import 'package:workout_planner_v81/widgets/custom_sized_box.dart';
import 'package:workout_planner_v81/widgets/exercise_card.dart';

class ExerciseDetailsPage extends StatefulWidget {
  final String title;
  final String description;
  final List<Exercise> exerciseList;
  const ExerciseDetailsPage({
    super.key,
    required this.title,
    required this.description,
    required this.exerciseList,
  });

  @override
  State<ExerciseDetailsPage> createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
  //Date and Time formatters
  final DateFormat weekdayMonthFormatter = DateFormat("EEEE,MMMM");
  final DateFormat dayFormatter = DateFormat("dd");

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formettedMonth = weekdayMonthFormatter.format(now);
    String formattedDay = dayFormatter.format(now);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "$formettedMonth $formattedDay",
              style: const TextStyle(
                color: gray,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              widget.title,
              style: const TextStyle(
                color: black,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.description,
                style: const TextStyle(
                  color: gray,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const CustomSizedBox2(),
              GridView.builder(
                shrinkWrap: true,
                //physics: ClampingScrollPhysics(),
                physics: const BouncingScrollPhysics(),
                //physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 32,
                ),
                itemCount: widget.exerciseList.length,
                itemBuilder: (context, index) {
                  Exercise exercise = widget.exerciseList[index];
                  return ExerciseCard(
                    title: exercise.exerciseName,
                    imageUrl: exercise.exerciseImageUrl,
                    description: "${exercise.noOfMinutes} of Workout",
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
