import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "title"),
      body: Center(
        child: Lottie.asset(
          Res.delivery,
          // width: 300,
          // height: 300,
          repeat: true,
        ),
      ),
    );
  }
}
