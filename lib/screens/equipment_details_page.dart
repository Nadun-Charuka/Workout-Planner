import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_v81/model/equipment_model.dart';
import 'package:workout_planner_v81/utils/colors.dart';
import 'package:workout_planner_v81/widgets/custom_sized_box.dart';
import 'package:workout_planner_v81/widgets/equipment_card.dart';

class EquipmentDetailsPage extends StatefulWidget {
  final String title;
  final String description;
  final List<Equipment> equipmentList;
  const EquipmentDetailsPage({
    super.key,
    required this.title,
    required this.description,
    required this.equipmentList,
  });

  @override
  State<EquipmentDetailsPage> createState() => _EquipmentDetailsPageState();
}

class _EquipmentDetailsPageState extends State<EquipmentDetailsPage> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                physics: const BouncingScrollPhysics(),
                //physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.equipmentList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 32,
                  crossAxisSpacing: 16,
                  childAspectRatio: 8 / 7,
                ),
                itemBuilder: (context, index) {
                  Equipment equipment = widget.equipmentList[index];
                  return EquipmentCard(
                    title: equipment.equipmentName,
                    imageUrl: equipment.equipmentImageUrl,
                    discription: equipment.equipmentDescription,
                    noOfMinutes: equipment.noOfMinutes,
                    noOfCalories: equipment.noOfCalories,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
