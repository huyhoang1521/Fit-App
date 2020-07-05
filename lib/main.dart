import 'package:flutter/material.dart';
import 'package:fit_app/screens/home/tab_system.dart';
import 'package:fit_app/services/auth_service.dart';
import 'package:fit_app/widgets/provider_widget.dart';
import 'screens/form/welcome.dart';
import 'screens/form/general.dart';
import 'screens/form/home_widget.dart';
import 'screens/form/first_view.dart';
import 'screens/form/sign_up.dart';
import 'screens/form/info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        theme: ThemeData(
            // Use the old theme but apply the following three changes
            textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Open Sans',
                bodyColor: Colors.black,
                displayColor: Colors.black)),
        home: HomeController(),
        routes: <String, WidgetBuilder>{
          '/general': (BuildContext context) => General(),
          '/homeview': (BuildContext context) => HomeWidget(),
          /*'/signUp': (BuildContext context) =>
              Welcome(authFormType: AuthFormType.signUp),*/
          '/signIn': (BuildContext context) =>
              Welcome(authFormType: AuthFormType.signIn),
          '/home': (BuildContext context) => HomeController(),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? TabSystem() : FirstView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
