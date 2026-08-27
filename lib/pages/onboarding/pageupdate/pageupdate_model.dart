import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/index.dart';
import 'package:flutter/material.dart';

class PageupdateModel extends FlutterFlowModel<PageupdateWidget> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future getoutofupdatepage(BuildContext context) async {
    if (FFAppConstants.appVersion >= getRemoteConfigInt('userMinimumAppVersion')
        ? true
        : true) {
      context.pushNamed(
        LoginWidget.routeName,
        extra: <String, dynamic>{
          '__transition_info__': TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    }
  }
}
