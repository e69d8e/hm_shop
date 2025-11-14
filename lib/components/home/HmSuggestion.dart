import 'package:flutter/material.dart';

class Hmsuggestion extends StatefulWidget {
  const Hmsuggestion({super.key});

  @override
  State<Hmsuggestion> createState() => _HmsuggestionState();
}

class _HmsuggestionState extends State<Hmsuggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 300,
        color: Colors.green,
        alignment: Alignment.center,
        child: Text('Hmsuggestion'),
      ),
    );
  }
}
