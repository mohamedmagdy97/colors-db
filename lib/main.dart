import 'package:colors_db/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'general/MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(BlocProvider(
    create: (BuildContext context) => LangCubit(),
    child: MyApp(),
  ));
}
