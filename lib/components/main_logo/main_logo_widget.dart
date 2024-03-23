import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_logo_model.dart';
export 'main_logo_model.dart';

class MainLogoWidget extends StatefulWidget {
  const MainLogoWidget({super.key});

  @override
  State<MainLogoWidget> createState() => _MainLogoWidgetState();
}

class _MainLogoWidgetState extends State<MainLogoWidget> {
  late MainLogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainLogoModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {

          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? 'assets/images/2.png'
                  : 'assets/images/1.png',
              width: 60,
              height: 40,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Market',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
              ),
              TextSpan(
                text: '.ika',
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: const Color(0xFF9279BA),
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              )
            ],
            style: FlutterFlowTheme.of(context).bodyMedium,
          ), textScaler: TextScaler.linear(MediaQuery.of(context).textScaleFactor),
        ),
      ],
    );
  }
}
