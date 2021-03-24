import 'package:flutter/material.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:photo_view/photo_view.dart';


// ignore: must_be_immutable
class ImageZoom extends StatelessWidget{

  final List<String> images;
  final int index;
  String _current="";
  final ValueNotifier _notifier=new ValueNotifier<int>(0);
  PageController _controller ;
  ImageZoom(this.images,this.index){
    _controller=new PageController(initialPage: index);
    _current= images[index];
  }


  _setChangeImage(index){
    _current=images[index];
    _notifier.value=index;
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.black87,
      appBar:AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios,size: 25,color: Colors.white,),
          onTap: (){Navigator.of(context).pop();},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share,size: 25,color: Colors.white,),
            onPressed: ()=>Utils.shareApp(_current),
          ),
        ],

      ),

      body: PageView(
        controller: _controller,
        onPageChanged: _setChangeImage,
        children: List.generate(images.length, (index){
          return Container(
            alignment: Alignment.center,
            child: PhotoView(
              backgroundDecoration: BoxDecoration(
                color: Colors.black87,
              ),
              imageProvider: NetworkImage(images[index]),
            ),
          );
        }),
      ),

    );
  }
}
