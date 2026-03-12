import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Base extends StatefulWidget {
  final Function updateBaseHandler;
  Base(this.updateBaseHandler);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus && controller.text.isNotEmpty) {
        widget.updateBaseHandler(controller.text);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(children: [
        const Text(
          'Base',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        SizedBox(
          height: 35,
          width: 120,
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            onChanged: (value) {
              if (value.isNotEmpty) widget.updateBaseHandler(value);
            },
            onSubmitted: (value) {
              if (value.isNotEmpty) widget.updateBaseHandler(value);
            },
            style: const TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.values[2],
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
            ],
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(bottom: 0),
                fillColor: Colors.white,
                filled: true),
          ),
        )
      ]),
    );
  }
}
