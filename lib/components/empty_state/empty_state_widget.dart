import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:flutter/material.dart';

import 'empty_state_model.dart';
export 'empty_state_model.dart';

class EmptyStateWidget extends StatefulWidget {
  const EmptyStateWidget({
    super.key,
    this.title,
    this.bodyText,
    this.icon,
  });

  final String? title;
  final String? bodyText;
  final Widget? icon;

  @override
  State<EmptyStateWidget> createState() => _EmptyStateWidgetState();
}

class _EmptyStateWidgetState extends State<EmptyStateWidget> {
  late EmptyStateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStateModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*context.watch<FFAppState>();*/

    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
            child: widget.icon!,
          ),
          Text(
            widget.title!,
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
            child: Text(
              widget.bodyText!,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
