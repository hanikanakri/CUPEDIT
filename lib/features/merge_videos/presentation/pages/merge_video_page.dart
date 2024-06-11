import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '/core/constants/app_colors.dart';
import '/core/utils/navigation.dart';
import '/core/widgets/buttons/main_elevated_button.dart';
import '/features/merge_videos/cubit/merge_videos_cubit.dart';
import '/features/merge_videos/cubit/merge_videos_state.dart';

class MergeVideosPage extends StatefulWidget {
  const MergeVideosPage({
    super.key,
    // this.originalFile,
    // this.totalVideoDuration,
  });

  // final File? originalFile;
  // final int? totalVideoDuration;

  @override
  State<MergeVideosPage> createState() => _MergeVideosPageState();
}

class _MergeVideosPageState extends State<MergeVideosPage> {
  MergeVideosCubit? mergeVideosCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mergeVideosCubit = MergeVideosCubit(
      context: context,
      //originalFile: widget.originalFile,
      //originalVideoDuration: widget.totalVideoDuration!,
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: size * 0.45,
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocConsumer<MergeVideosCubit, MergeVideosState>(
            bloc: mergeVideosCubit,
            listener: (BuildContext context, state) {
              if (state is LoadMergeVideos) {
                EasyLoading.show(status: "merging".tr());
              }
              if (state is SuccessMergeVideos) {
                EasyLoading.dismiss();
                EasyLoading.showSuccess('success'.tr());
              }
              if (state is ErrorMergeVideos) {
                EasyLoading.showError('merge_failed'.tr());
              }
              if (state is CancelMergeVideos) {
                EasyLoading.showError("merge_canceled".tr());
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  MainElevatedButton(
                    buttonColor: AppColors.black12,
                    onPressed: () {
                      mergeVideosCubit!.selectVideo();
                    },
                    text: "select_video",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MainElevatedButton(
                    buttonColor: AppColors.black12,
                    onPressed: () {
                      mergeVideosCubit!.cancelMergeVideos().then(
                        (value) {
                          Navigation.pop(context);
                        },
                      );
                    },
                    text: "cancel",
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
