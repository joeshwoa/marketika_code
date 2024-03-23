import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:marketika_website/components/top_nav/top_nav_model.dart';

import 'blogs_page.dart' show BlogsPage;
import 'package:flutter/material.dart';

class BlogsPageModel extends FlutterFlowModel<BlogsPage> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topNav component.
  late TopNavModel topNavModel;

  /// Initialization and disposal methods.

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
