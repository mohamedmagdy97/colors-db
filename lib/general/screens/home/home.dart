part of 'home_imports.dart';

class Home extends StatefulWidget {
  final SelectionDataModel selectionDataModel;

  const Home({Key? key, required this.selectionDataModel}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar(
        title: 'Home',
        actions: [
          IconButton(
            onPressed: () => AutoRouter.of(context).pop(),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            Res.bg,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          BuildHomeBody(widget: widget),
        ],
      ),
    );
  }
}
