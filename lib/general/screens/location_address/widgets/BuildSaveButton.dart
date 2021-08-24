part of 'LocationWidgetsImports.dart';


class BuildSaveButton extends StatelessWidget {
  final LocationAddressData locationAddressData;

  const BuildSaveButton({required this.locationAddressData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: ()=>locationAddressData.changeLocation(context),
          child: Container(
            height: 45,
            width: MediaQuery.of(context).size.width * .7,
            decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(30)),
            alignment: Alignment.center,
            child: MyText(
              title: tr(context,'saveLocation'),
              size: 12,
              color: MyColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
