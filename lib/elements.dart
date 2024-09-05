
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class listElements{
  final Widget icon;
  final String text;
  final Function callBack;
  const listElements(this.text,this.icon,this.callBack);

  factory listElements.fromJson(Map<String,dynamic> json){
    return listElements(
      json['text'] as String,
      json['icon'] as Widget,
      json['callBack'] as Function,
    );
  }

}