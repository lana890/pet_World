

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/Providers/UserProvider.dart';
import 'package:pet_world/modules/PetWorld/signin_Screen.dart';
import 'package:provider/provider.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider(),),
        ],

        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Instagram Clone',
            theme: ThemeData.light(),
            home: SigninScreen()
        )
    );
  }

}
