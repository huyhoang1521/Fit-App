import 'package:fit_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/services/auth_service.dart';
import 'package:fit_app/components/general/provider/provider_widget.dart';
import 'package:provider/provider.dart';
import 'components/themes/theme.dart';
import 'screens/form/first_view.dart';
import 'screens/form/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {}
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return ProviderWidget(
            auth: AuthService(),
            child: ChangeNotifierProvider(
              create: (_) => ThemeNotifier(),
              child: Consumer<ThemeNotifier>(
                builder: (context, ThemeNotifier notifier, child) {
                  return MaterialApp(
                    theme: notifier.darkTheme ? dark : light,
                    home: HomeController(),
                    routes: <String, WidgetBuilder>{
                      '/signIn': (BuildContext context) => SignIn(),
                      '/home': (BuildContext context) => HomeController(),
                    },
                  );
                },
              ),
            ),
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = ProviderWidget.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? Home() : FirstView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
