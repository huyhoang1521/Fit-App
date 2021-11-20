import 'package:cloud_firestore/cloud_firestore.dart';

/* 
 * Selects the warmup exercises for the Users's workout.
 * Depending on the age of the user, a certain number of exercises
 * will be added to their workout. After each workout is completed,
 * the user will receive a different set of warmups for the next workout, 
 * since each time warmup exercises are selected at random.
*/

final db = FirebaseFirestore.instance;
List<Map<String, dynamic>> warmupList = [];

class Warmup {
  double age;

  // Constructor
  Warmup([this.age]);

  /* 
   * Starts by fetching all bloodflow, mobility, and core exercises.
   * Stores each category of exercises in separate lists. Calls method 
   * to calculate how much of each exercise to put in the workout.
  */
  Future<List<Map<String, dynamic>>> setWarmUpList() async {
    List<dynamic> bloodFlowList = [];
    List<dynamic> mobilityList = [];
    List<dynamic> coreList = [];
    int amountOfExercises;
    int length = (10 + age / 4).round();
    print("length is " + length.toString());

    await db
        .collection('Warmups')
        .orderBy('id', descending: false)
        .get()
        .then((collection) async {
      bloodFlowList = (collection.docs
          .where((doc) => doc["category"] == "Blood Flow")
          .map((category) => category.data()['id'])).toList();
      mobilityList = (collection.docs
          .where((doc) => doc["category"] == "Mobility")
          .map((category) => category.data()['id'])).toList();
      coreList = (collection.docs
          .where((doc) => doc["category"] == "Core")
          .map((category) => category.data()['id'])).toList();

      amountOfExercises = determineAmount("Blood Flow", length);
      await addToList(bloodFlowList, amountOfExercises);
      amountOfExercises = determineAmount("Mobility", length);
      await addToList(mobilityList, amountOfExercises);
      amountOfExercises = determineAmount("Core", length);
      await addToList(coreList, amountOfExercises);
    });

    printWarmupList(warmupList);
    return warmupList;
  }

  /* 
   * Determines the amount of each category of warmup to put in the user's workout.
   * Sets the starting amount and max of each category. If the length is greater 
   * than 25, the user needs the full amount. Else, use the formula to calculate 
   * the new amount.
  */
  int determineAmount(String category, int length) {
    int amount;
    int max;

    if (category == "Blood Flow") {
      amount = 4;
      max = 6;
    } else if (category == "Mobility") {
      amount = 5;
      max = 9;
    } else if (category == "Core") {
      amount = 2;
      max = 3;
    }

    if (length >= 25) {
      amount = max;
    } else {
      print("amount += (" +
          length.toString() +
          " - 15) * ((" +
          max.toString() +
          " - " +
          amount.toString() +
          ") / 11) = " +
          ((length - 15) * ((max - amount) / 11)).round().toString());

      amount += ((length - 15) * ((max - amount) / 11)).round();
    }

    print(category + " amount is " + amount.toString());
    return amount;
  }

  /* 
   * Adds warmup exercises to the user's workout. Given an exercise
   * list, it will choose a certain number of exercises to add.
   * Picks random exercises by shuffling the list prior to picking.
  */
  Future<void> addToList(List<dynamic> categoryList, int amount) async {
    List<int> shuffledList = [];
    for (int i = 0; i < amount; i++) {
      if (!shuffledList.contains(categoryList[i].toInt())) {
        shuffledList.add(categoryList[i].toInt());
      }
    }
    shuffledList.shuffle();
    for (int exercise in shuffledList) {
      await db
          .collection('Warmups')
          .where('id', isEqualTo: exercise)
          .limit(1)
          .get()
          .then((snapshot) {
        warmupList.add(snapshot.docs[0].data());
      });
    }
  }

  /* 
   * Prints the warmup list that will be added to the user's workout.
   * Only prints id's of each exercise. However, all data from each
   * exercise is added to the workout
  */
  void printWarmupList(List<Map<String, dynamic>> warmupList) {
    if (warmupList.isEmpty) {
      print('WARMUP LIST IS EMPTY');
    } else {
      String str = "WARMUP LIST: ";
      for (int i = 0; i < warmupList.length; i++) {
        if (i == 0) {
          str += "[" + warmupList[i]['id'].toString() + ", ";
        } else if (i == warmupList.length - 1) {
          str += warmupList[i]['id'].toString() + "]";
        } else {
          str += warmupList[i]['id'].toString() + ", ";
        }
      }
      print(str);
    }
  }
}
