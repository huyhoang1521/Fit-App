import 'package:flutter/material.dart';
import 'package:fit_app/screens/home/tab_system.dart';
import 'package:fit_app/services/auth_service.dart';
import 'package:fit_app/widgets/provider_widget.dart';
import 'screens/form/welcome.dart';
import 'screens/form/general.dart';

class App extends StatelessWidget {
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
          '/signUp': (BuildContext context) =>
              Welcome(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) =>
              Welcome(authFormType: AuthFormType.signIn),
          '/home': (BuildContext context) => HomeController(),
          '/general': (BuildContext context) => General(),
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
          return signedIn
              ? TabSystem()
              : Welcome(authFormType: AuthFormType.signUp);
        }
        return CircularProgressIndicator();
      },
    );
  }
}
