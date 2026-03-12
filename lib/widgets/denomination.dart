import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/widgets/coin.dart';
import '/params.dart';

class Denomination extends StatefulWidget {
  const Denomination({super.key});

  @override
  State<Denomination> createState() => _DenominationState();
}

class _DenominationState extends State<Denomination> {
  var controller = TextEditingController();

  void _removeValueHandler(int index) {
    print("Remove number: $index");
    setState(() {
      denominationList.removeAt(index);
    });
  }

  void _addButtonFunction() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 700,
          color: Colors.green[500],
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    const Text(
                      "Enter chips value:",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[+-]?(\d+(\.\d*)?|\.\d+)$'))],
                      maxLength: 11,
                      controller: controller,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[200],
                        ),
                        hintText: "Insert Here",
                        border: const UnderlineInputBorder(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      height: 50,
                      width: 100,
                      color: Colors.green[500],
                      child: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.check),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                          if (controller.text.isNotEmpty) {
                            denominationList.add(controller.text);
                            denominationList
                                .sort((a, b) => double.parse(a).compareTo(double.parse(b))); // sort the list
                            print(denominationList);
                            setState(() {
                              controller.text = "";
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Chip Values',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: denominationList.length,
                itemBuilder: (context, index) {
                  return Coin(_removeValueHandler, denominationList, index);
                },
              ),
            ),
            (denominationList.length < 6)
                ? Container(
                    alignment: Alignment.center,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ElevatedButton(
                        onPressed: _addButtonFunction,
                        style: ElevatedButton.styleFrom(
                          // styling the button
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(1),
                          backgroundColor: Colors.white, // Button color
                        ),
                        child: const Icon(Icons.add, color: Colors.green), // icon of the button
                      ),
                    ]),
                  )
                : Container()
          ],
        ),
      ],
    );
  }
}
