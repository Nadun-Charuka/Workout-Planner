import 'package:workout_planner_v81/model/equipment_model.dart';
import 'package:workout_planner_v81/model/exercise_model.dart';

class User {
  final String userId;
  final String fullName;
  final String gender;
  final String address;
  final int age;
  final String description;

  int totalExerciseCompleted = 0;
  int totalEquipmentsHandOvered = 0;

  final List<Exercise> exerciseList;
  final List<Equipment> equipmentList;
  final List<Exercise> favoriteExerciseList;
  final List<Equipment> favoriteEquipmentList;

  User({
    required this.userId,
    required this.fullName,
    required this.gender,
    required this.address,
    required this.age,
    required this.description,
    required this.exerciseList,
    required this.equipmentList,
    required this.favoriteExerciseList,
    required this.favoriteEquipmentList,
  });
  //method to add a exercise
  void addExercise(Exercise exercise) {
    exerciseList.add(exercise);
  }

  //method to remove a exercise
  void removeExercise(Exercise exercise) {
    exerciseList.remove(exercise);
  }

  //method to add a favoriteexercise
  void addFavouriteExercise(Exercise exercise) {
    favoriteExerciseList.add(exercise);
  }

  //method to remove a favoriteexercise
  void removeFavouriteExercise(Exercise exercise) {
    favoriteExerciseList.remove(exercise);
  }

  //method to add a equipment
  void addEquipment(Equipment equipment) {
    equipmentList.add(equipment);
  }

  //method to remove a equipment
  void removeEquipment(Equipment equipment) {
    equipmentList.remove(equipment);
  }

  //method to add a favoriteequipment
  void addFavouriteEquipment(Equipment equipment) {
    favoriteEquipmentList.add(equipment);
  }

  //method to add a favoriteequipment
  void removeFavouriteEquipment(Equipment equipment) {
    favoriteEquipmentList.remove(equipment);
  }

  //method to calculate the total minutes spend
  int calculateTotalMinutesSpent() {
    int totalMinutesSpent = 0;

    //loop through the exerciseList and calculate noOfMinutes
    for (var exercise in exerciseList) {
      totalMinutesSpent += exercise.noOfMinutes;
    }
    //loop through the equipmentList and calculate noOfMinutes
    for (var equipment in equipmentList) {
      totalMinutesSpent += equipment.noOfMinutes;
    }
    return totalMinutesSpent;
  }

  //method to make exercise as completed
  void markExerciseAsCompleted(int exerciseId) {
    final exercise =
        exerciseList.firstWhere((exercise) => exercise.id == exerciseId);

    exercise.completed = true;
    //remove from the exercise list
    removeExercise(exercise);

    totalExerciseCompleted++;
  }

  //method to make equipment as handover
  void markAshandovered(int equipmentId) {
    final equipment =
        equipmentList.firstWhere((equipment) => equipment.id == equipmentId);

    equipment.handOvered = true;
    //remove from the equipment list
    removeEquipment(equipment);
    totalEquipmentsHandOvered++;
  }

  //method to calculate the total number of calories burned by the user
  double calculateTotalCaloriesBurned() {
    double totalCaloriedBurned = 0;
    for (var equipment in equipmentList) {
      totalCaloriedBurned += equipment.noOfCalories;
    }
    // convert into 0 - 1
    if (totalCaloriedBurned > 0 && totalCaloriedBurned < 10) {
      totalCaloriedBurned = totalCaloriedBurned / 10;
    }
    if (totalCaloriedBurned > 10 && totalCaloriedBurned < 100) {
      totalCaloriedBurned = totalCaloriedBurned / 100;
    }
    if (totalCaloriedBurned > 100 && totalCaloriedBurned < 1000) {
      totalCaloriedBurned = totalCaloriedBurned / 1000;
    }
    if (totalCaloriedBurned > 1000 && totalCaloriedBurned < 10000) {
      totalCaloriedBurned = totalCaloriedBurned / 10000;
    }

    return totalCaloriedBurned;
  }
}
