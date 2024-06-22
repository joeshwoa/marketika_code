import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NavTabWidget extends StatefulWidget {
  const NavTabWidget({super.key, required this.title, required this.onTap, this.selected = false});

  final String title;
  final Function() onTap;
  final bool selected;

  @override
  State<NavTabWidget> createState() => _NavTabWidgetState();
}

class _NavTabWidgetState extends State<NavTabWidget> {
  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        TintEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: Colors.black,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4,left: 4,bottom: widget.selected?4:0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: widget.onTap,
        onHover: (hovering) {
          setState(() {
            isHover = hovering;
          });
        },
        child: Container(
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: isHover||widget.selected?Color(0xff9279ba):Colors.grey,
              width: widget.selected?2:1
            ),
            color: AdaptiveTheme.of(context).brightness == Brightness.light?Theme.of(context).hoverColor:Colors.white60
          ),
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Padding(
              padding:
              const EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
              child: Text(
                widget.title,
                style: FlutterFlowTheme.of(context)
                    .headlineSmall
                    .override(
                  fontFamily: FlutterFlowTheme.of(context)
                      .headlineSmallFamily,
                  fontSize: 14,
                  useGoogleFonts: GoogleFonts.asMap()
                      .containsKey(
                      FlutterFlowTheme.of(context)
                          .headlineSmallFamily),
                ),
              ).animateOnPageLoad(
                  animationsMap['textOnPageLoadAnimation']!),
            ),
          ),
        ),
      ),
    );
  }
}

