// import 'package:flutter/material.dart';
//
// import '/features/edit_new_project/presentation/widgets/general_new_project_scaffold.dart';
//
// class EditVideos extends StatelessWidget {
//   const EditVideos({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double size = MediaQuery.of(context).size.height;
//     return GeneralNewProjectScaffold(
//       body: Column(
//         children: [
//           Center(
//             child: Container(
//               width: 50,
//               height: 50,
//               color: Colors.white,
//             ),
//           ),
//           const Spacer(),
//           _buildListEditTools(
//             context,
//             size,
//           ),
//         ],
//       ),
//     );
//   }
//
//   _buildListEditTools(BuildContext context, double size) {
//     return SizedBox(
//       height: size * 0.085,
//       child: ListView.builder(
//         itemCount: 10,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Container(
//             width: 25,
//             color: Colors.red,
//             margin: const EdgeInsets.all(15),
//           );
//         },
//       ),
//     );
//   }
// }
