import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'general/MyApp.dart';

// import 'main.mapper.g.dart' show initializeJsonMapper;

void main()async{
  // initializeJsonMapper();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    BlocProvider(
      create: (BuildContext context) => LangCubit(),
      child: MyApp(),
    )
  );
}
