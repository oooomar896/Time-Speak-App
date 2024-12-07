
import 'package:flutter/material.dart';

showeloding(context){
  return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
            backgroundColor: Colors.white54,
            title: Text("please waitting"),
            content:Container(
              margin: EdgeInsets.all(10),
              height: 50,
              child:Center(child: CircularProgressIndicator()),)
        );
      });
}