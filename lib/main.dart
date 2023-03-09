  /*
    CODIGO OBTENIDO DE SEGUIR EL SIGUIENTE TUTORIAL 
    https://www.youtube.com/watch?v=CjCTNPKhgXc
   */

import 'package:bloc_with_api/pages/home_page.dart';
import 'package:bloc_with_api/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //This part is't only mandatory, if you are going to load data from a server,
      //if not, then you can just simply ignore it and continue from homePage
      home: RepositoryProvider(
        create: (context) => UserRepository(),
        child: const HomePage(),
      ),
    );
  }
}
