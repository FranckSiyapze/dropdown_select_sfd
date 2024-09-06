# DROPDOWN SELECT SFD
A flutter package for dropdown select
<img src="https://siyapze-franck.ca/screen.png" width="240"/>

## Install
1: Import the plugin using
```dart
 import 'package:dropdown_select_sfd/select.dart';
```

2: Initialize your list.
You can initialize it in the iniState or in any other way you like.
```dart
  List<ListElements> elements = [];
  @override
void initState() {
  // TODO: implement initState
  super.initState();
  elements = [
    ListElements(
        "Use my phone number",
        Icon(
          Icons.phone,
          color: KprimaryText,
          size: 24,
        ),
            () => {
          print("Phone tapped"),
        }),
    ListElements(
      'Use my e-mail address',
      Icon(
        Icons.mail,
        color: KprimaryText,
        size: 24,
      ),
          () => {
        print("Mail tapped"),
      },
    )
  ];
}
```
listElements is the object to be used by the list
its attribute is :
- “icon” which is a widget (can take an Icon, SvgPicture,etc..)
- text": the text to be inserted
- callBack": A callback function to be executed when this element is interacted with.

3: Use the package in your code.
```dart
Center(
    child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 500,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: DropdownSelectSFD(
            leading: const Icon(
                Icons.settings_suggest,
                color: Color(0xFF305083),
            ),
            color: const Color.fromRGBO(48, 80, 131, 0.54),
            elements: elements,
            labelTextDefault: 'Please select a value',
        ),
    ),
),
```

- labelTextDefault : is the value that appears by default
- color : is the color of the text (labelTextDefault)
- leading : is the icon that appear by defaults
- elements : this is the list we want to display

<img src="https://siyapze-franck.ca/screen_1.png" width="240"/>


## Contribute

You can contribute us by filing issues, bugs and PRs.

### Contributing:

- Open issue regarding proposed change.
- Repo owner will contact you there.
- If your proposed change is approved, Fork this repo and do changes.
- Open PR against latest `dev` branch. Add nice description in PR.
- You're done!
