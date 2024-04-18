import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:marketika_website/components/gradient_button/gradient_button_model.dart';
import 'package:marketika_website/components/top_nav/top_nav_model.dart';

import 'blog_page.dart' show ProductDetailsWidget;
import 'package:flutter/material.dart';

class ProductDetailsModel extends FlutterFlowModel<ProductDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topNav component.
  late TopNavModel topNavModel;
  // Model for gradientButton component.
  late GradientButtonModel gradientButtonModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    topNavModel = createModel(context, () => TopNavModel());
    gradientButtonModel = createModel(context, () => GradientButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    topNavModel.dispose();
    gradientButtonModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
