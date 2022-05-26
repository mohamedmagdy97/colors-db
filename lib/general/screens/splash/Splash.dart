part of 'SplashImports.dart';

class Splash extends StatefulWidget {

  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkingData();
    super.initState();
  }

  _checkingData() async {
    Future.delayed(
        const Duration(seconds: 3), () => Utils.manipulateSplashData(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Res.bg,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Center(
              child: AnimationContainer(
                  index: 0,
                  vertical: true,
                  duration: const Duration(milliseconds: 1500),
                  distance: MediaQuery.of(context).size.height * .3,
                  child: Hero(
                    tag: Res.logo,
                    child: Image.asset(Res.logo, width: 125, height: 125),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
