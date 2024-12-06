import 'package:flutter/material.dart';
import 'package:workout_planner_v81/utils/colors.dart';
import 'package:workout_planner_v81/widgets/custom_sized_box.dart';

class AddEquipmentCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String discription;
  final int noOfMinutes;
  final double noOfCalories;
  final bool isAdd;
  final bool isFavorite;
  final void Function() toggleAddEquipment;
  final void Function() toggleAddFavoriteEquipment;

  const AddEquipmentCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.discription,
    required this.noOfMinutes,
    required this.noOfCalories,
    required this.isAdd,
    required this.toggleAddEquipment,
    required this.toggleAddFavoriteEquipment,
    required this.isFavorite,
  });

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: gray,
              offset: Offset(1, 1),
              blurRadius: 3,
            ),
          ],
          color: lightGray,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  color: black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    widget.imageUrl,
                    width: 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 220,
                        child: Text(
                          widget.discription,
                          style: const TextStyle(
                            color: gray,
                            fontSize: 15,
                          ),
                          //overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const CustomSizedBox1(),
                      Text(
                        "Time ${widget.noOfMinutes} min and \n${widget.noOfCalories} cal burned",
                        style: const TextStyle(
                            color: blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              const CustomSizedBox1(),
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
                      onPressed: () {
                        widget.toggleAddEquipment();
                      },
                      icon: Icon(
                        widget.isAdd ? Icons.remove : Icons.add,
                        color: blue,
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
                      onPressed: () {
                        widget.toggleAddFavoriteEquipment();
                      },
                      icon: Icon(
                        widget.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: red,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
