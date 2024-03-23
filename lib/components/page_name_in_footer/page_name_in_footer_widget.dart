import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

class PageNameInFooterWidget extends StatelessWidget {
  const PageNameInFooterWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1, 0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {

        },
        onHover: (bool isHover) {

        },
        child: Text(
          name,
          style: FlutterFlowTheme.of(context)
              .bodyMedium,
        ),
      ),
    );
  }
}
