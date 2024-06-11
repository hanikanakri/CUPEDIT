import 'package:flutter/material.dart';

class SaveProject extends StatelessWidget {
  const SaveProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Container(
            width: 150,
            height: 150,
            color: Colors.white,
            child: const Text("saving..."),
          ),
        ),
      ],
    );
  }
}
