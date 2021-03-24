import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/resources/GeneralRepository.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/general/widgets/MyText.dart';


class Terms extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TermsState();
  }

}

class _TermsState extends State<Terms>{

  GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: ("terms"), //"الشروط والأحكام",
        con: context,
      ),
      key: _scaffold,
      body: FutureBuilder<String>(
        future: GeneralRepository(context).terms(),
        builder: (con,snapshot){
          if(snapshot.hasData){
            return ListView(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
              children: [
                MyText(
                  title: snapshot.data,
                  size: 10,
                  color: MyColors.blackOpacity,
                ),
              ],
            );
          }else{
            return Center(
              child: LoadingDialog.showLoadingView(),
            );
          }
        },
      ),
    );
  }
}