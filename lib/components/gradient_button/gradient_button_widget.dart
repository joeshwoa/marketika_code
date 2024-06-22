import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import 'gradient_button_model.dart';
export 'gradient_button_model.dart';

class GradientButtonWidget extends StatefulWidget {
  const GradientButtonWidget({
    super.key,
    required this.action,
  });

  final Future Function()? action;

  @override
  State<GradientButtonWidget> createState() => _GradientButtonWidgetState();
}

class _GradientButtonWidgetState extends State<GradientButtonWidget>
    with TickerProviderStateMixin {
  late GradientButtonModel _model;

  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(1, 1),
          end: const Offset(1.2, 1.2),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GradientButtonModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
      anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click,
      onEnter: ((event) async {
        setState(() => _model.mouseRegionHovered = true);
        if (animationsMap['iconOnActionTriggerAnimation'] != null) {
          animationsMap['iconOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0);
        }
      }),
      onExit: ((event) async {
        setState(() => _model.mouseRegionHovered = false);
        if (animationsMap['iconOnActionTriggerAnimation'] != null) {
          animationsMap['iconOnActionTriggerAnimation']!.controller.reverse();
        }
      }),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await widget.action?.call();
        },
        child: Stack(
          alignment: const AlignmentDirectional(0, 0),
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x33000000),
                    offset: Offset(
                      0,
                      1,
                    ),
                  )
                ],
                gradient: LinearGradient(
                  colors: [
                    Color(0xff9279ba),
                    FlutterFlowTheme.of(context).tertiary
                  ],
                  stops: const [0, 1],
                  begin: const AlignmentDirectional(1, -1),
                  end: const AlignmentDirectional(-1, 1),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.mouseRegionHovered
                          ? Colors.transparent
                          : const Color(0xFF25254F),
                      const Color(0xFF25254F),
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
            Icon(
              Icons.home_rounded,
              color: FlutterFlowTheme.of(context).info,
              size: 20,
            ).animateOnActionTrigger(
              animationsMap['iconOnActionTriggerAnimation']!,
            ),
          ],
        ),
      ),
    );
  }
}
