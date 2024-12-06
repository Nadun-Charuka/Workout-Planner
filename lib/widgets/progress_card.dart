import 'package:flutter/material.dart';
import 'package:workout_planner_v81/utils/colors.dart';
import 'package:workout_planner_v81/widgets/custom_sized_box.dart';

class ProgressCard extends StatefulWidget {
  final double progressValue; //0-1 ex 0.6 0.33 0.74
  final int total;

  const ProgressCard({
    super.key,
    required this.progressValue,
    required this.total,
  });

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    int done = (widget.progressValue * widget.total).toInt();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            lightBlue,
            blue,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Proteins, Fats & \nCarbohydrates",
              style: TextStyle(
                color: white,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            const CustomSizedBox2(),
            LinearProgressIndicator(
              minHeight: 10,
              borderRadius: BorderRadius.circular(20),
              value: widget.progressValue,
              backgroundColor: blue,
              valueColor: const AlwaysStoppedAnimation(white),
            ),
            const CustomSizedBox1(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTag("done", done.toString()),
                _buildTag("total", widget.total.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: white,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value,
          style: const TextStyle(
              color: white, fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
