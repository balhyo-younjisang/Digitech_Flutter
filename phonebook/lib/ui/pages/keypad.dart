import 'package:flutter/material.dart';
import 'package:phonebook/ui/widgets/keypadTile.dart';

class KeypadScreen extends StatefulWidget {
  const KeypadScreen({super.key});

  @override
  State<StatefulWidget> createState() => _KeypadScreenState();
}

class _KeypadScreenState extends State<KeypadScreen> {
  late String inputPhone;
  late String formattedPhone;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputPhone = "";
    formattedPhone = "";
  }

  void clickNumber(String number) {
    inputPhone += number;
    setState(() {
      if (inputPhone.length > 3 && inputPhone.length <= 6) {
        formattedPhone =
            "${inputPhone.substring(0, 3)}-${inputPhone.substring(3, inputPhone.length)}";
      } else if (inputPhone.length >= 8) {
        formattedPhone =
            "${inputPhone.substring(0, 3)}-${inputPhone.substring(3, 7)}-${inputPhone.substring(7, inputPhone.length)}";
      } else {
        formattedPhone = inputPhone;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Flexible(
              flex: 3,
              child: Center(
                child: Text(
                  formattedPhone,
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 2,
                ),
                children: [
                  KeypadTile(
                    key: UniqueKey(),
                    keypadNumber: "1",
                    specialCharacter: "",
                    clickHandler: clickNumber,
                  ),
                  KeypadTile(
                    key: UniqueKey(),
                    keypadNumber: "2",
                    specialCharacter: "ABC",
                    clickHandler: clickNumber,
                  ),
                  KeypadTile(
                    key: UniqueKey(),
                    keypadNumber: "3",
                    specialCharacter: "DEF",
                    clickHandler: clickNumber,
                  ),
                  KeypadTile(
                    key: UniqueKey(),
                    keypadNumber: "4",
                    specialCharacter: "GHI",
                    clickHandler: clickNumber,
                  ),
                  KeypadTile(
                    key: UniqueKey(),
                    keypadNumber: "5",
                    specialCharacter: "JKL",
                    clickHandler: clickNumber,
                  ),
                  KeypadTile(
                    key: UniqueKey(),
                    keypadNumber: "6",
                    specialCharacter: "MNO",
                    clickHandler: clickNumber,
                  ),
                  KeypadTile(
                    key: UniqueKey(),
                    keypadNumber: "7",
                    specialCharacter: "PQRS",
                    clickHandler: clickNumber,
                  ),
                  KeypadTile(
                    key: UniqueKey(),
                    keypadNumber: "8",
                    specialCharacter: "TUV",
                    clickHandler: clickNumber,
                  ),
                  KeypadTile(
                    key: UniqueKey(),
                    keypadNumber: "9",
                    specialCharacter: "WXYZ",
                    clickHandler: clickNumber,
                  ),
                  KeypadTile(
                    key: UniqueKey(),
                    keypadNumber: "*",
                    specialCharacter: "",
                    clickHandler: clickNumber,
                  ),
                  KeypadTile(
                    key: UniqueKey(),
                    keypadNumber: "0",
                    specialCharacter: "ABC",
                    clickHandler: clickNumber,
                  ),
                  KeypadTile(
                    key: UniqueKey(),
                    keypadNumber: "#",
                    specialCharacter: "DEF",
                    clickHandler: clickNumber,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  inputPhone.isNotEmpty
                      ? ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          iconSize: 28,
                          padding: EdgeInsets.all(12),
                        ),
                        child: Icon(Icons.video_call_rounded),
                      )
                      : SizedBox(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(12),
                      backgroundColor: Colors.green,
                      iconColor: Colors.white,
                      iconSize: 32,
                    ),
                    child: Icon(Icons.call),
                  ),
                  inputPhone.isNotEmpty
                      ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            inputPhone = inputPhone.substring(
                              0,
                              inputPhone.length - 1,
                            );
                            formattedPhone = inputPhone;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          iconSize: 28,
                          padding: EdgeInsets.all(12),
                        ),
                        child: Icon(Icons.remove),
                      )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
