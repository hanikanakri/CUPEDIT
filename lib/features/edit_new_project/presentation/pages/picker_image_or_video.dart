import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '/features/edit_new_project/presentation/widgets/general_new_project_scaffold.dart';

class PickerImageOrVideo extends StatelessWidget {
  const PickerImageOrVideo({
    super.key,
    required this.assetEntity,
  });

  final AssetEntity assetEntity;

  @override
  Widget build(BuildContext context) {
    double size =MediaQuery.of(context).size.height;
    return GeneralNewProjectScaffold(
      body: Column(
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (assetEntity.type == AssetType.image)
            Center(
              child: SizedBox(
                height: size*0.8,
                child: Image(
                  image: AssetEntityImageProvider(
                    assetEntity,
                  ),
                ),
              ),
            ),
          if (assetEntity.type == AssetType.video) const Center(),
        ],
      ),
    );
    /*return AssetEntityImageProvider(assetEntity);*/
  }
}
