import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final TextAlign? alien;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  MyText({required this.title,required this.color,required this.size, this.alien,this.decoration,this.overflow,this.fontWeight=FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      textAlign: alien??TextAlign.start,
      textScaleFactor: 1.2,
//      overflow: TextOverflow.ellipsis,
      style: context.read<LangCubit>().state.locale.languageCode=="ar"?
      GoogleFonts.cairo(
          color: color??Colors.black,
          fontSize: size??16,
          decoration: decoration??TextDecoration.none,
          fontWeight: fontWeight
      ):
      GoogleFonts.roboto(
          color: color??Colors.black,
          fontSize: size??16,
          decoration: decoration??TextDecoration.none,
          fontWeight: fontWeight
      ),
      overflow: overflow,
    );
  }
}
