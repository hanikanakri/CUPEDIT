import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/animations/fade_animation.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/shared_storage.dart';

class ChangeVideoQuality extends StatefulWidget {
  ChangeVideoQuality({
    super.key,
    this.quality,
  });

  ValueChanged<String>? quality;

  @override
  State<ChangeVideoQuality> createState() => _ChangeVideoQualityState();
}

class _ChangeVideoQualityState extends State<ChangeVideoQuality> {
  late final ValueNotifier<double> _slider = ValueNotifier<double>(0);

  late final ValueNotifier<int> _sliderText =
      ValueNotifier<int>(SharedStorage.getVideoQuality());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sliderValue();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _slider.dispose();
    _sliderText.dispose();
  }

  String qualityText = '';

  Future<int?> _sliderValue() async {
    //late int value;
    switch (SharedStorage.getVideoQuality()) {
      case 300:
        _slider.value = 0;
        _sliderText.value = 144;

        break;

      case 500:
        _slider.value = 1;
        _sliderText.value = 240;

        break;

      case 1000:
        _slider.value = 3;
        _sliderText.value = 360;

        break;

      case 1500:
        _slider.value = 4;
        _sliderText.value = 480;
        //setState(() {});
        break;

      case 3000:
        _slider.value = 6;
        _sliderText.value = 720;
        //setState(() {});
        break;

      case 5000:
        _slider.value = 7;
        _sliderText.value = 1080;

        break;

      case 8000:
        _slider.value = 9;
        _sliderText.value = 1440;
        //setState(() {});
        break;

      case 16000:
        _slider.value = 10;
        _sliderText.value = 2160;
        //setState(() {});
        break;
    }

    return _slider.value.toInt();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height * 0.25;

    return FadeAnimation(
      fadeDirection: FadeDirection.bottom,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: size,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.black,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "video".tr(),
                          style: AppTheme.headline.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 5,
                          width: 35,
                          decoration: BoxDecoration(
                            color: AppColors.blue.shade100,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.greyTest,
                      ),
                      child: Center(
                        child: ValueListenableBuilder<int>(
                          valueListenable: _sliderText,
                          builder: (context, value, child) {
                            return Text(
                              "${_sliderText.value}p",
                              style: AppTheme.headline5.copyWith(
                                color: AppColors.white,
                              ),
                            );
                          },
                          //  child: ,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "quality".tr(),
                        style: AppTheme.headline.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        overlayColor: AppColors.white,
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 15.0,
                        ),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 8,
                        ),
                      ),
                      child: ValueListenableBuilder<double>(
                        valueListenable: _slider,
                        builder: (context, value, child) {
                          return ValueListenableBuilder<int>(
                            valueListenable: _sliderText,
                            builder: (BuildContext context, int value,
                                Widget? child) {
                              return Slider(
                                value: _slider.value,
                                min: 0.0,
                                max: 10.0,
                                divisions: 7,
                                autofocus: true,
                                activeColor: AppColors.blue.shade100,
                                secondaryActiveColor: Colors.amber,
                                inactiveColor: AppColors.grey,
                                label: "${value.toInt()}p",
                                onChanged: (value) {
                                  print(value.round());

                                  switch (value.round()) {
                                    case 0:
                                      _sliderText.value = 144;
                                      SharedStorage.writeVideoQuality(300);
                                      widget.quality!("144p");

                                      break;
                                    case 1:
                                      _sliderText.value = 240;
                                      widget.quality!("240p");
                                      SharedStorage.writeVideoQuality(500);

                                      break;
                                    case 3:
                                      _sliderText.value = 360;
                                      widget.quality!("360p");
                                      SharedStorage.writeVideoQuality(1000);

                                      break;
                                    case 4:
                                      _sliderText.value = 480;
                                      widget.quality!("480p");
                                      SharedStorage.writeVideoQuality(1500);

                                      break;
                                    case 6:
                                      _sliderText.value = 720;
                                      widget.quality!("720p");
                                      SharedStorage.writeVideoQuality(3000);

                                      break;
                                    case 7:
                                      _sliderText.value = 1080;
                                      widget.quality!("1080p");
                                      SharedStorage.writeVideoQuality(5000);

                                      break;
                                    case 9:
                                      _sliderText.value = 1440;
                                      widget.quality!("1440p");
                                      SharedStorage.writeVideoQuality(8000);

                                      break;
                                    case 10:
                                      _sliderText.value = 2160;
                                      widget.quality!("2kp");
                                      SharedStorage.writeVideoQuality(16000);

                                      break;
                                  }
                                  print(_sliderText.value.toInt());
                                  _slider.value = value;
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
