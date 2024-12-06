import 'package:workout_planner_v81/model/equipment_model.dart';
import 'package:workout_planner_v81/model/exercise_model.dart';
import 'package:workout_planner_v81/model/user_model.dart';

User user = User(
  userId: "123456",
  fullName: "Nadu Chruka",
  gender: "Male",
  address: "145/4,Nugeemulla road, Rukmale, Pannipitiya",
  age: 21,
  description: "Fitness ethusiast",
  exerciseList: [
    Exercise(
      id: 0,
      exerciseName: "Push-Ups",
      exerciseImageUrl: "assets/images/exercises/downward-facing.png",
      noOfMinutes: 10,
      completed: false,
    ),
    Exercise(
      exerciseName: "Push-ups",
      exerciseImageUrl: "assets/images/exercises/cobra.png",
      noOfMinutes: 15,
      id: 0,
      completed: false,
    ),
  ],
  equipmentList: [
    Equipment(
      id: 0,
      equipmentName: "Dumbbells",
      equipmentDescription:
          "A pair of dumbbells for strength training exercises.",
      equipmentImageUrl: "assets/images/equipments/calendar.png",
      noOfMinutes: 30,
      noOfCalories: 2,
      handOvered: false,
    ),
    Equipment(
      id: 1,
      equipmentName: "Resistance Bands",
      equipmentDescription: "Elastic bands used for resistance exercises.",
      equipmentImageUrl: "assets/images/equipments/checklist.png",
      noOfMinutes: 20,
      handOvered: false,
      noOfCalories: 15,
    ),
  ],
  favoriteExerciseList: [
    Exercise(
      exerciseName: "test",
      exerciseImageUrl: "assets/images/exercises/downward-facing.png",
      noOfMinutes: 20,
      id: 1,
      completed: false,
    ),
    Exercise(
      exerciseName: "test",
      exerciseImageUrl: "assets/images/exercises/dragging.png",
      noOfMinutes: 30,
      id: 2,
      completed: false,
    ),
  ],
  favoriteEquipmentList: [
    Equipment(
      id: 2,
      equipmentName: "test",
      equipmentDescription: "A mat for practicing yoga and floor exercises.",
      equipmentImageUrl: "assets/images/equipments/dumbbell.png",
      noOfMinutes: 60,
      handOvered: false,
      noOfCalories: 30,
    ),
    Equipment(
      id: 3,
      equipmentName: "test",
      equipmentDescription:
          "A rope used for cardiovascular exercises and coordination training.",
      equipmentImageUrl: "assets/images/equipments/dumbbells.png",
      noOfMinutes: 15,
      handOvered: false,
      noOfCalories: 12,
    ),
  ],
);
