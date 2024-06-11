import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_theme.dart';
import '/core/widgets/loading.dart';

class ProgressModal {
  _Progress? _progress;
  late BuildContext _context;
  BuildContext? _cancelContext;
  late bool displayed;

  ProgressModal(BuildContext context) {
    _context = context;
    displayed = false;
  }

  void show(String message, {Function? cancelFunction}) {
    if (displayed) {
      return;
    }
    if (cancelFunction == null) {
      _progress = _Progress(message);
    } else {
      _progress = _Progress(message, cancelFunction: () {
        cancelFunction();
        hide();
      },);
    }

    showDialog<dynamic>(
        context: _context,
        barrierDismissible: cancelFunction != null,
        builder: (BuildContext context) {
          _cancelContext = context;
          return PopScope(
              onPopInvoked:(didPop) {
                didPop = cancelFunction != null;
              },
              child: Dialog(
                  backgroundColor: Colors.white,
                  insetAnimationCurve: Curves.easeInOut,
                  insetAnimationDuration: const Duration(milliseconds: 100),
                  elevation: 10.0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: _progress,),);
        },);

    displayed = true;
  }

  void update({String? message}) {
    if (displayed) {
      _progress!.update(message: message);
    }
  }

  void hide() {
    if (displayed && _cancelContext != null) {
      Navigator.of(_cancelContext!).pop();
      displayed = false;
    }
  }
}

class _Progress extends StatefulWidget {
  final _ProgressState _progressState;

  _Progress(String message, {Function? cancelFunction})
      : _progressState =
            _ProgressState(message, cancelFunction: cancelFunction);

  update({String? message}) {
    _progressState.update(message: message);
  }

  @override
  State<StatefulWidget> createState() {
    return _progressState;
  }
}

class _ProgressState extends State<_Progress> {
  String _message;
  final Function? _cancelFunction;

  _ProgressState(this._message, {Function? cancelFunction})
      : _cancelFunction = cancelFunction;

  update({String? message}) {
    if (message != null) {
      _message = message;
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  _message.tr(),
                  style: AppTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),),
              ],
            ),
          ],
        ),
      ),
    );

    var cancelRow = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: () => _cancelFunction!(),
            child: Container(
              width: 100,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'cancel'.tr(),
                  style: AppTheme.bodySmall,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    var widgets = _cancelFunction == null
        ? [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 10.0),
                const SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: LoadingWidget(),
                ),
                const SizedBox(width: 20.0),
                text,
                const SizedBox(width: 20.0)
              ],
            ),
          ]
        : [
            Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                width: 50.0,
                height: 80.0,
                child: const CircularProgressIndicator(),
              ),
            ],),
            Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  text,
                ],
              ),
              cancelRow
            ],),
          ];

    return Container(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: widgets,
      ),
    );
  }
}
