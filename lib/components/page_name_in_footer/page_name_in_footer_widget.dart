import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

class PageNameInFooterWidget extends StatefulWidget {
  const PageNameInFooterWidget({super.key, required this.name, required this.onTap});
  final String name;
  final Function() onTap;

  @override
  State<PageNameInFooterWidget> createState() => _PageNameInFooterWidgetState();
}

class _PageNameInFooterWidgetState extends State<PageNameInFooterWidget> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(1, 0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: widget.onTap,
        onHover: (bool hovering) {
          setState(() {
            isHover = hovering;
          });
        },
        child: Text(
          widget.name,
          style: FlutterFlowTheme.of(context)
              .bodyMedium.override(
            fontFamily: FlutterFlowTheme.of(context)
                .bodyMediumFamily,
            fontWeight: isHover?FontWeight.w700:FontWeight.w500
          ),
        ),
      ),
    );
  }
}
