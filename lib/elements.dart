
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListElements{
  final Widget icon;
  final String text;
  final Function callBack;
  const ListElements(this.text,this.icon,this.callBack);

  factory ListElements.fromJson(Map<String,dynamic> json){
    return ListElements(
      json['text'] as String,
      json['icon'] as Widget,
      json['callBack'] as Function,
    );
  }

}