import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AdCardWidget extends StatelessWidget {
  const AdCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (responsiveVisibility(
      context: context,
      phone: false,
    )) return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor:
      Colors.transparent,
      onTap: () async {

      },
      onHover: (bool isHover) async {

      },
      child: Container(
        width: 200,
        height:
        MediaQuery.sizeOf(context)
            .height *
            0.2,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              'https://picsum.photos/200/300',
            ),
          ),
          gradient: LinearGradient(
            colors: [
              Color(0x0014181B),
              Color(0x9914181B)
            ],
            stops: [0.4, 1],
            begin: AlignmentDirectional(
                0, -1),
            end: AlignmentDirectional(
                0, 1),
          ),
          borderRadius:
          BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize:
            MainAxisSize.max,
            mainAxisAlignment:
            MainAxisAlignment.end,
            crossAxisAlignment:
            CrossAxisAlignment
                .start,
            children: [
              Container(
                decoration:
                BoxDecoration(
                  color: FlutterFlowTheme
                      .of(context)
                      .accent4,
                  borderRadius:
                  BorderRadius
                      .circular(8),
                  border: Border.all(
                    color: FlutterFlowTheme
                        .of(context)
                        .secondaryBackground,
                  ),
                ),
                child: Padding(
                  padding:
                  EdgeInsets.all(
                      12),
                  child: Column(
                    mainAxisSize:
                    MainAxisSize
                        .max,
                    mainAxisAlignment:
                    MainAxisAlignment
                        .end,
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      Text(
                        'About US',
                        style: FlutterFlowTheme.of(
                            context)
                            .titleSmall
                            .override(
                          fontFamily:
                          FlutterFlowTheme.of(context)
                              .titleSmallFamily,
                          color: FlutterFlowTheme.of(
                              context)
                              .primaryText,
                          useGoogleFonts: GoogleFonts
                              .asMap()
                              .containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional
                            .fromSTEB(
                            0,
                            4,
                            0,
                            0),
                        child: Text(
                          '320 Products',
                          style: FlutterFlowTheme.of(
                              context)
                              .bodyMedium
                              .override(
                            fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context)
                                .primaryText,
                            useGoogleFonts:
                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    else if (responsiveVisibility(
      context: context,
      tablet: false,
      tabletLandscape: false,
      desktop: false,
    )) return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor:
      Colors.transparent,
      onTap: () async {

      },
      onHover: (bool isHover) async {

      },
      child: Container(
        width: 200,
        height:
        MediaQuery.sizeOf(context)
            .height *
            0.2,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              'https://picsum.photos/200/300',
            ),
          ),
          gradient: LinearGradient(
            colors: [
              Color(0x0014181B),
              Color(0x9914181B)
            ],
            stops: [0.4, 1],
            begin: AlignmentDirectional(
                0, -1),
            end: AlignmentDirectional(
                0, 1),
          ),
          borderRadius:
          BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            mainAxisSize:
            MainAxisSize.max,
            mainAxisAlignment:
            MainAxisAlignment.end,
            crossAxisAlignment:
            CrossAxisAlignment
                .start,
            children: [
              Container(
                decoration:
                BoxDecoration(
                  color: FlutterFlowTheme
                      .of(context)
                      .accent4,
                  borderRadius:
                  BorderRadius
                      .circular(8),
                  border: Border.all(
                    color: FlutterFlowTheme
                        .of(context)
                        .secondaryBackground,
                  ),
                ),
                child: Padding(
                  padding:
                  EdgeInsets.all(4),
                  child: Column(
                    mainAxisSize:
                    MainAxisSize
                        .max,
                    mainAxisAlignment:
                    MainAxisAlignment
                        .end,
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      Text(
                        'About US',
                        style: FlutterFlowTheme.of(
                            context)
                            .titleSmall
                            .override(
                          fontFamily:
                          FlutterFlowTheme.of(context)
                              .titleSmallFamily,
                          color: FlutterFlowTheme.of(
                              context)
                              .primaryText,
                          fontSize:
                          10,
                          useGoogleFonts: GoogleFonts
                              .asMap()
                              .containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    else return SizedBox();
  }
}
