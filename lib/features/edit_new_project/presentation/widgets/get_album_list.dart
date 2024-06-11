// import '/features/edit_new_project/presentation/new_project_cubit/new_project_cubit.dart';
// import '/features/edit_new_project/presentation/new_project_cubit/new_project_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';
//
// class GetAlbumList extends StatefulWidget {
//   const GetAlbumList({super.key});
//
//   @override
//   State<GetAlbumList> createState() => _GetAlbumListState();
// }
//
// class _GetAlbumListState extends State<GetAlbumList> {
//
//
//   NewProjectCubit? newProjectCubit;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     newProjectCubit = NewProjectCubit();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NewProjectCubit, NewProjectState>(bloc: newProjectCubit,
//       builder: (context, state) {
//         return DropdownButton<AssetPathEntity>(
//           value: newProjectCubit?.selectedAlbum,
//           onChanged: (AssetPathEntity? value) {
//             setState(() {
//               newProjectCubit?.selectedAlbum = value;
//             });
//             newProjectCubit?.loadAssets(newProjectCubit!.selectedAlbum!).then((value) {
//               setState(() {
//                 newProjectCubit?.assetList = value;
//               });
//             });
//           },
//           items: newProjectCubit?.albumList.map<DropdownMenuItem<AssetPathEntity>>(
//                 (AssetPathEntity e) {
//               return DropdownMenuItem<AssetPathEntity>(
//                 value: e,
//                 child: FutureBuilder<int>(
//                   future: e.assetCountAsync,
//                   builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Text("${e.name} Loading...");
//                     }
//                     if (snapshot.hasData) {
//                       return Text("${e.name} ${snapshot.data}");
//                     }
//                     return Text("${e.name} Error");
//                   },
//                 ),
//               );
//             },
//           ).toList(),
//         );
//       },
//     );
//   }
// }
