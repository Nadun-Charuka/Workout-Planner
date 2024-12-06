import 'package:flutter/material.dart';
import 'package:workout_planner_v81/utils/colors.dart';

class ProfileCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final void Function() markAsDone;
  const ProfileCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.markAsDone,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: lightGray,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.asset(
              widget.imageUrl,
              width: 50,
              fit: BoxFit.cover,
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(
              flex: 8,
            ),
            IconButton(
              onPressed: () {
                widget.markAsDone();
              },
              icon: const Icon(
                Icons.check,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
