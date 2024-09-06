library dropdown_select_sfd;

import 'package:flutter/material.dart';
import 'elements.dart';

/// A widget that provides a dropdown selection with custom styling
/// and behavior options.
class DropdownSelectSFD extends StatefulWidget {
  /// The default text to display when no option is selected.
  final String? labelTextDefault ;

  /// An optional leading widget, typically an icon, to display before the dropdown.
  final Widget leading;

  /// The background color of the dropdown.
  final Color color;

  /// The list of elements to display in the dropdown.
  final List<ListElements> elements;

  /// Creates a DropdownSelectSFD widget with the provided configuration.
  ///
  /// [color] sets the dropdown's background color.
  /// [elements] is the list of items that the user can select from.
  /// [labelTextDefault] is the placeholder text shown before selection.
  /// [leading] is an optional widget placed before the dropdown.


  const DropdownSelectSFD({
    super.key,
    required this.leading,
    required this.color,
    required this.elements,
    this.labelTextDefault = "Veuillez choisir le mode de connexion",
  });

  @override
  State<DropdownSelectSFD> createState() => _DropdownSelectSFDState();
}

class _DropdownSelectSFDState extends State<DropdownSelectSFD> {
  bool more = false;
  String value = '';
  Widget iconValue = const Text('');
  Color color = const Color.fromRGBO(48, 80, 131, 0.21);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color = widget.color;
    iconValue = widget.leading;
    value = widget.labelTextDefault!;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              more = !more;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(left: 12, right: 12),
            padding: const  EdgeInsets.only(
              left: 12,
              right: 12,
              top: 0,
              bottom: 0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: color),
            ),
            child: ListTile(
              leading: iconValue,
              title: Text(
                value,
                style: TextStyle(
                  color: color,
                  fontFamily: "Inter",
                  fontSize: 12,
                ),
              ),
              trailing: Icon(
                Icons.arrow_drop_down,
                color: color,
              ),
            ),
          ),
        ),

        if (more)
          Container(
            margin: const EdgeInsets.only(top: 5, left: 12, right: 12),
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: color),
            ),
            child: Column(
              children: [
                ListView.builder(
                  itemCount: widget.elements.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: widget.elements[index].icon, // Display the icon
                      title: Text(widget.elements[index].text,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Inter",
                          color: color,
                        ),), // Display the text
                      onTap: (){
                        setState(() {
                          more = false;
                          iconValue =  widget.elements[index].icon;
                          value =  widget.elements[index].text;
                        });
                        widget.elements[index].callBack();
                      }, // Trigger the callback
                    );
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}
