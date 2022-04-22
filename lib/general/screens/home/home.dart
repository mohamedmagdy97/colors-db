part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeData homeData = HomeData();

  @override
  void initState() {
    homeData.fetchData(context, pageKey: 1);
    homeData.pagingController.addPageRequestListener((pageKey) {
      homeData.fetchData(context, pageKey: pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar(
        title: 'مدفوعات هلا',
        actions: [
          IconButton(
              onPressed: () => homeData.profile(context),
              icon: Icon(Icons.person))
        ],
        leading: IconButton(
            onPressed: () => homeData.logout(context),
            icon: Icon(Icons.logout)),
      ),
      body: Stack(
        children: [
          Image.asset(
            Res.bg,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          BuildHomeView(homeData: homeData)
        ],
      ),
    );
  }
}
