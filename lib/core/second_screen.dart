import 'package:flutter/cupertino.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
       child: Text('Second Screen'),
    );
  }
}
