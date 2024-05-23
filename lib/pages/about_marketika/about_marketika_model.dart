import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:marketika_website/components/top_nav/top_nav_model.dart';

import 'about_marketika.dart' show AboutMarketika;
import 'package:flutter/material.dart';

class AboutMarketikaModel extends FlutterFlowModel<AboutMarketika> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topNav component.
  late TopNavModel topNavModel;

  @override
  void initState(BuildContext context) {
    topNavModel = createModel(context, () => TopNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    topNavModel.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
