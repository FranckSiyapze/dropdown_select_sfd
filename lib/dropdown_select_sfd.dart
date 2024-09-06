library dropdown_select_sfd;

import 'package:flutter/material.dart';
import 'elements.dart';
/// A Calculator.


class DropdownSelectSFD extends StatefulWidget {
  final String? labelTextDefault ;
  final Widget leading;
  final Color color;
  final List<ListElements> elements;
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
  Widget iconValue = Text('');
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
            margin: EdgeInsets.only(top: 5, left: 12, right: 12),
            padding: EdgeInsets.only(
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
