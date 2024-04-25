import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:marketika_website/components/top_nav/top_nav_model.dart';

import 'home_page.dart' show HomePage;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePage> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topNav component.
  late TopNavModel topNavModel;
  // State field(s) for TextField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchController;
  String? Function(BuildContext, String?)? searchControllerValidator;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // State field(s) for TextField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    topNavModel = createModel(context, () => TopNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    topNavModel.dispose();
    searchFieldFocusNode?.dispose();
    searchController?.dispose();

    nameFieldFocusNode?.dispose();
    nameController?.dispose();

    emailFieldFocusNode?.dispose();
    emailController?.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
