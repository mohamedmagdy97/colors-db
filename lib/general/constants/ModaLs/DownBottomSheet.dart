import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/ModaLs/ModalHelper.dart';
import 'package:base_flutter/general/widgets/MyText.dart';


class DownBottomSheet {

  var data=[];
  Function(String,String) onTab;
  BuildContext context;
  String title;
  DownBottomSheet({this.data,this.onTab,this.context,this.title});

  show(){
    return  ModalHelper.showModal(
      context: context,
      title: title,
      expand: false,
      content: Container(
        height: 300,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: data.length,
            itemBuilder: (BuildContext con,int position){
              return InkWell(
                onTap: ()=>onTab(data[position].name,data[position].id.toString()),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.withOpacity(.5),width: 1)
                      )
                  ),
                  child: MyText(
                    title: data[position].name,
                    color: Colors.grey,
                    size: 12,
                  ),
                ),
              );
            },
          ),
      ),
    );
  }

}