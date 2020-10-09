import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
List<int> warmupList;
int amountOfExercises;

class WarmUp {
  double age;

  // In the constructor
  WarmUp(this.age);

  List<int> createWarmUp() {
    warmupList = new List();
    queryDataBase("Blood Flow");
    queryDataBase("Mobility");
    queryDataBase("Core");
    return warmupList;
  }

  void queryDataBase(String category) async {
    await db
        .collection('Warmups')
        .where('category', isEqualTo: category)
        .orderBy('id', descending: false)
        .get()
        .then((QuerySnapshot docs) {
      if (docs.docs.isNotEmpty) {
        amountOfExercises = determineAmount(docs, category);
        addToList(docs, amountOfExercises);
      }
    });
  }

  int determineAmount(QuerySnapshot docs, String category) {
    int amount;
    int max;
    int length = (10 + age / 4).round();
    print("length is " + length.toString());
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
          ") / 11)");

      amount += ((length - 15) * ((max - amount) / 11)).round();
    }

    print(category + " amount is " + amount.toString());
    return amount;
  }

  void addToList(QuerySnapshot docs, int amount) {
    List<int> shuffledList = new List();
    for (int i = 0; i < amount; i++) {
      if (!shuffledList.contains(docs.docs[i].data()['id'])) {
        shuffledList.add(docs.docs[i].data()['id']);
      }
    }
    shuffledList.shuffle();
    for (int exercise in shuffledList) {
      warmupList.add(exercise);
    }
  }
}
