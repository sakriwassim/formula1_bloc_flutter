import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/characters_cubit.dart';
import '../../data/repository/characters_repository.dart';
import '../../data/web_services/characters_web_services.dart';
import '../../presentation/screens/characters_screen.dart';
import '../controllers/auth_controller.dart';
import 'auth_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

late CharactersRepository charactersRepository =
    CharactersRepository(CharactersWebServices());
late CharactersCubit charactersCubit = CharactersCubit(charactersRepository);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Auth().authStateChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BlocProvider<CharactersCubit>(
              create: (context) => charactersCubit,
              child: const CharactersScreen(),
            );
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
