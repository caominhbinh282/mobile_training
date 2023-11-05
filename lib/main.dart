import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/resultsearchscreen.dart';
import '/screens/searchscreen.dart';
import 'controller/providercontroller.dart';
import 'screens/loginscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => ProviderController(),
      child: MaterialApp(
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

}

