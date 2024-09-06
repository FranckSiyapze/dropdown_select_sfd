import 'package:flutter/material.dart';

/// A class that represents an element with an icon, text, and a callback function.
class ListElements {
  /// The icon to display for this element.
  final Widget icon;

  /// The text to display for this element.
  final String text;

  /// A callback function to be executed when this element is interacted with.
  final Function callBack;

  /// Creates a `ListElements` instance with the provided text, icon, and callback.
  const ListElements(this.text, this.icon, this.callBack);

  /// Creates a `ListElements` instance from a JSON object.
  ///
  /// [json] is the map containing the key-value pairs to initialize the properties.
  ///
  /// The `icon` is expected to be a widget and `callBack` should be a function.
  factory ListElements.fromJson(Map<String, dynamic> json) {
    return ListElements(
      json['text'] as String,
      json['icon'] as Widget, // Ensure that the widget is deserialized properly
      json['callBack'] as Function, // Ensure that the callback is a valid function
    );
  }

  /// Converts the `ListElements` instance into a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'icon': icon, // Handle serialization of widgets appropriately.
      'callBack': callBack, // Handle serialization of callback functions if necessary.
    };
  }
}
