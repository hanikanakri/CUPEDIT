import 'package:flutter/material.dart';

import '/core/widgets/buttons/main_elevated_button.dart';
import '/features/edit_new_project/items_cubit/media_process_cubit.dart';

class SSSG extends StatefulWidget {
  const SSSG({super.key});

  @override
  State<SSSG> createState() => _SSSGState();
}

class _SSSGState extends State<SSSG> {
  MediaProcessCubit mediaProcessCubit = MediaProcessCubit();

  Offset offset = const Offset(270, 700);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.white,
            child: MainElevatedButton(onPressed: () {}, text: "text"),
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            left: offset.dx,
            top: offset.dy,
            child: Draggable(
              feedback: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.red,
                child: const Icon(Icons.add, color: Colors.white),
              ),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                setState(() {
                  offset = dragDetails.offset;
                });
              },
              child: const Text("data"),
            ),
          ),
        ],
      ),
    );
  }
}
