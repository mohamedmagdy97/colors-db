import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class ImageZoom extends StatefulWidget {
  final List images;

  const ImageZoom({required this.images});
  @override
  _ImageZoomState createState() => _ImageZoomState();
}

class _ImageZoomState extends State<ImageZoom> {

  var _current;
  final ValueNotifier _notifier=new ValueNotifier<int>(0);
  late PageController _controller ;


  @override
  void initState() {
    _controller=new PageController(initialPage: 0);
    _current= widget.images.first;
    super.initState();
  }

  _setChangeImage(index){
    _current=widget.images[index];
    _notifier.value=index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar:AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios,size: 25,color: Colors.white,),
          onTap: (){Navigator.of(context).pop();},
        ),
      ),

      body: PageView(
        controller: _controller,
        onPageChanged: _setChangeImage,
        children: List.generate(widget.images.length, (index){
          return Container(
            alignment: Alignment.center,
            child: PhotoView(
              backgroundDecoration: BoxDecoration(
                color: Colors.black87,
              ),
              imageProvider: NetworkImage(widget.images[index]),
            ),
          );
        }),
      ),

    );
  }
}

