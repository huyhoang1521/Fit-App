import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

List<int> warmupList;
int amountOfExercises;
List<dynamic> bloodFlowList;
List<dynamic> mobilityList;
List<dynamic> coreList;
int length;

class Warmup {
  double age;

  // In the constructor
  Warmup(this.age);

  /* 
  * Class for warmup
  * Creates the warmup for the Users's workout
  */
  Future<List<int>> createWarmUp() async {
    warmupList = new List();
    bloodFlowList = new List();
    mobilityList = new List();
    coreList = new List();
    await db
        .collection('Warmups')
        .orderBy('id', descending: false)
        .get()
        .then((collection) {
      bloodFlowList = (collection.docs
          .where((doc) => doc["category"] == "Blood Flow")
          .map((category) => category.data()['id'])).toList();
      mobilityList = (collection.docs
          .where((doc) => doc["category"] == "Mobility")
          .map((category) => category.data()['id'])).toList();
      coreList = (collection.docs
          .where((doc) => doc["category"] == "Core")
          .map((category) => category.data()['id'])).toList();

      length = (10 + age / 4).round();
      print("length is " + length.toString());

      amountOfExercises = determineAmount("Blood Flow");
      addToList(bloodFlowList, amountOfExercises);
      amountOfExercises = determineAmount("Mobility");
      addToList(mobilityList, amountOfExercises);
      amountOfExercises = determineAmount("Core");
      addToList(coreList, amountOfExercises);
    });

    return warmupList;
  }

  int determineAmount(String category) {
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

  void addToList(List<dynamic> categoryList, int amount) {
    List<int> shuffledList = new List();
    for (int i = 0; i < amount; i++) {
      if (!shuffledList.contains(categoryList[i].toInt())) {
        shuffledList.add(categoryList[i].toInt());
      }
    }
    shuffledList.shuffle();
    for (int exercise in shuffledList) {
      warmupList.add(exercise);
    }
  }

  void printWarmupList(List<int> warmupList) {
    if (warmupList.isEmpty) {
      print('WARMUP LIST IS EMPTY');
    } else {
      String str = "WARMUP LIST: ";
      for (int i = 0; i < warmupList.length; i++) {
        if (i == 0) {
          str += "[" + warmupList[i].toString() + ", ";
        } else if (i == warmupList.length - 1) {
          str += warmupList[i].toString() + "]";
        } else {
          str += warmupList[i].toString() + ", ";
        }
      }
      print(str);
    }
  }
}
