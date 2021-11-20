import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/controllers/exercise_data_controller.dart';
import 'package:fit_app/models/exercises_sheets.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';

class ExerciseSheetsData extends StatefulWidget {
  @override
  _ExerciseSheetsDataState createState() => new _ExerciseSheetsDataState();
}

class _ExerciseSheetsDataState extends State<ExerciseSheetsData> {
  Future<List<ExercisesSheets>> getSheetsItems() =>
      Future.delayed(Duration(seconds: 8), () async {
        List<ExercisesSheets> sheetsItems = [];
        ExerciseDataController().getSheetsList().then((newSheetsItems) {
          sheetsItems = newSheetsItems;
        });
        await Future.delayed(Duration(seconds: 6));
        return sheetsItems;
      });

  @override
  Widget build(BuildContext context) => FutureBuilder(
      // Get the warmup and progression lists from their respective collections
      future: getSheetsItems(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done &&
            snapshot.data.isNotEmpty) {
          return Scaffold(
            appBar: CustomAppBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Store Google Sheets data in Firebase"),
                  RoundedButton(
                    text: "Store data",
                    press: () async {
                      List<ExercisesSheets> sheetsItems = snapshot.data;

                      for (int i = 0; i < snapshot.data.length - 1; i++) {
                        ExercisesSheets sheets = sheetsItems[i];
                        print("Exercise: " + i.toString());
                        await FirebaseFirestore.instance
                            .collection("Exercises")
                            .doc(sheets.name)
                            .set(sheets.toJson());

                        print("Completed at: " + i.toString());
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          // We can show the loading view until the data comes back.
          return Scaffold(
            appBar: AppBar(
              title: Text('Fit With Nick'),
              elevation: 5,
            ),
            body: CircularProgressIndicator(),
          );
        }
      });
}
