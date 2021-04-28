// @dart=2.9
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'general/MyApp.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    BlocProvider(
      create: (BuildContext context) => LangCubit(),
      child:  Phoenix(child: MyApp()),
    )
  );
}
