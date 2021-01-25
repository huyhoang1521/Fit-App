import 'package:fit_app/models/fit_user.dart';
import 'package:flutter/material.dart';

class UserWorkoutProvider with ChangeNotifier {
  String userUid;
  FitUser fitUser = new FitUser(
      null, null, null, null, null, null, null, null, null, null, null, null);

  void setFitUser(FitUser fituser) {
    fitUser = fituser;
  }

  void setUid(String uid) {
    userUid = uid;
  }
}
