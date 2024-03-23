import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';


class BlogCardWidget extends StatelessWidget {
  const BlogCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (responsiveVisibility(
      context: context,
      phone: false,
      desktop: false,
    )) return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {

        },
        child: Material(
          color: Colors.transparent,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(10),
          ),
          child: Container(
            width:
            MediaQuery.sizeOf(context).width *
                0.31,
            height: MediaQuery.sizeOf(context)
                .height *
                0.5,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context)
                  .secondaryBackground,
              borderRadius:
              BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height:
                  MediaQuery.sizeOf(context)
                      .height *
                      0.18,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(
                      bottomLeft:
                      Radius.circular(0),
                      bottomRight:
                      Radius.circular(0),
                      topLeft:
                      Radius.circular(10),
                      topRight:
                      Radius.circular(10),
                    ),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius:
                        BorderRadius.only(
                          bottomLeft:
                          Radius.circular(0),
                          bottomRight:
                          Radius.circular(0),
                          topLeft:
                          Radius.circular(10),
                          topRight:
                          Radius.circular(10),
                        ),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: 'https://picsum.photos/seed/11/600',
                          width: double.infinity,
                          height:
                          MediaQuery.sizeOf(
                              context)
                              .height *
                              0.18,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(
                            context)
                            .height *
                            0.18,
                        decoration: BoxDecoration(
                          gradient:
                          LinearGradient(
                            colors: [
                              Colors.transparent,
                              Color(0xAA000000)
                            ],
                            stops: [0, 1],
                            begin:
                            AlignmentDirectional(
                                0, -1),
                            end:
                            AlignmentDirectional(
                                0, 1),
                          ),
                          borderRadius:
                          BorderRadius.only(
                            bottomLeft:
                            Radius.circular(
                                0),
                            bottomRight:
                            Radius.circular(
                                0),
                            topLeft:
                            Radius.circular(
                                10),
                            topRight:
                            Radius.circular(
                                10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional
                      .fromSTEB(6, 6, 6, 6),
                  child: AutoSizeText(
                    'كيف تستخدم تطبيقات الذكاء الاصطناعي في التسويق 2024 لتضاعف الإنتاجية؟ \t\t\t',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(
                        context)
                        .displaySmall
                        .override(
                      fontFamily:
                      FlutterFlowTheme.of(
                          context)
                          .displaySmallFamily,
                      fontSize: 26,
                      fontWeight:
                      FontWeight.bold,
                      useGoogleFonts: GoogleFonts
                          .asMap()
                          .containsKey(
                          FlutterFlowTheme.of(
                              context)
                              .displaySmallFamily),
                      lineHeight: 1.3,
                    ),
                    minFontSize: 20,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional
                        .fromSTEB(6, 6, 6, 6),
                    child: AutoSizeText(
                      '“إنتاجية أكثر، في وقت أقل” مطلب هذا العصر. ولا يعني هذا المطلب مضاعفة الجهد أو تقليله، بل توظيف الجهد البشري في الأشياء الأكثر حاجة إليه، والتي لا تزال الآلة غير قادرة على القيام بها. فكيف تساعدك تطبيقات الذكاء الاصطناعي في التسويق على تحقيق هذا الهدف؟  في العملية التسويقية توجد الكثير',
                      textAlign: TextAlign.end,
                      style: FlutterFlowTheme.of(
                          context)
                          .labelLarge
                          .override(
                        fontFamily:
                        FlutterFlowTheme.of(
                            context)
                            .labelLargeFamily,
                        fontSize: 20,
                        useGoogleFonts: GoogleFonts
                            .asMap()
                            .containsKey(
                            FlutterFlowTheme.of(
                                context)
                                .labelLargeFamily),
                        lineHeight: 1.3,
                      ),
                      minFontSize: 16,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color:
                  FlutterFlowTheme.of(context)
                      .secondaryText,
                ),
                Align(
                  alignment:
                  AlignmentDirectional(1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional
                        .fromSTEB(0, 0, 6, 6),
                    child: Text(
                      'فبراير 11, 2024',
                      style: FlutterFlowTheme.of(
                          context)
                          .bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    else if (responsiveVisibility(
      context: context,
      tablet: false,
      tabletLandscape: false,
      desktop: false,
    )) return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {

        },
        child: Material(
          color: Colors.transparent,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(10),
          ),
          child: Container(
            width:
            MediaQuery.sizeOf(context).width *
                0.9,
            height: MediaQuery.sizeOf(context)
                .height *
                0.4,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context)
                  .secondaryBackground,
              borderRadius:
              BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height:
                  MediaQuery.sizeOf(context)
                      .height *
                      0.18,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(
                      bottomLeft:
                      Radius.circular(0),
                      bottomRight:
                      Radius.circular(0),
                      topLeft:
                      Radius.circular(10),
                      topRight:
                      Radius.circular(10),
                    ),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius:
                        BorderRadius.only(
                          bottomLeft:
                          Radius.circular(0),
                          bottomRight:
                          Radius.circular(0),
                          topLeft:
                          Radius.circular(10),
                          topRight:
                          Radius.circular(10),
                        ),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: 'https://picsum.photos/seed/11/600',
                          width: double.infinity,
                          height:
                          MediaQuery.sizeOf(
                              context)
                              .height *
                              0.18,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(
                            context)
                            .height *
                            0.18,
                        decoration: BoxDecoration(
                          gradient:
                          LinearGradient(
                            colors: [
                              Colors.transparent,
                              Color(0xAA000000)
                            ],
                            stops: [0, 1],
                            begin:
                            AlignmentDirectional(
                                0, -1),
                            end:
                            AlignmentDirectional(
                                0, 1),
                          ),
                          borderRadius:
                          BorderRadius.only(
                            bottomLeft:
                            Radius.circular(
                                0),
                            bottomRight:
                            Radius.circular(
                                0),
                            topLeft:
                            Radius.circular(
                                10),
                            topRight:
                            Radius.circular(
                                10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional
                      .fromSTEB(6, 6, 6, 6),
                  child: AutoSizeText(
                    'كيف تستخدم تطبيقات الذكاء الاصطناعي في التسويق 2024 لتضاعف الإنتاجية؟ \t\t\t',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(
                        context)
                        .displaySmall
                        .override(
                      fontFamily:
                      FlutterFlowTheme.of(
                          context)
                          .displaySmallFamily,
                      fontSize: 26,
                      fontWeight:
                      FontWeight.bold,
                      useGoogleFonts: GoogleFonts
                          .asMap()
                          .containsKey(
                          FlutterFlowTheme.of(
                              context)
                              .displaySmallFamily),
                      lineHeight: 1.3,
                    ),
                    minFontSize: 20,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color:
                  FlutterFlowTheme.of(context)
                      .secondaryText,
                ),
                Align(
                  alignment:
                  AlignmentDirectional(1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional
                        .fromSTEB(0, 0, 6, 6),
                    child: Text(
                      'فبراير 11, 2024',
                      style: FlutterFlowTheme.of(
                          context)
                          .bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    else if (responsiveVisibility(
      context: context,
      phone: false,
      tablet: false,
      tabletLandscape: false,
    )) return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {

        },
        child: Material(
          color: Colors.transparent,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(10),
          ),
          child: Container(
            width:
            MediaQuery.sizeOf(context).width *
                0.25,
            height: MediaQuery.sizeOf(context)
                .height *
                0.8,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context)
                  .secondaryBackground,
              borderRadius:
              BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height:
                  MediaQuery.sizeOf(context)
                      .height *
                      0.25,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(
                      bottomLeft:
                      Radius.circular(0),
                      bottomRight:
                      Radius.circular(0),
                      topLeft:
                      Radius.circular(10),
                      topRight:
                      Radius.circular(10),
                    ),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius:
                        BorderRadius.only(
                          bottomLeft:
                          Radius.circular(0),
                          bottomRight:
                          Radius.circular(0),
                          topLeft:
                          Radius.circular(10),
                          topRight:
                          Radius.circular(10),
                        ),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: 'https://picsum.photos/seed/11/600',
                          width: double.infinity,
                          height:
                          MediaQuery.sizeOf(
                              context)
                              .height *
                              0.25,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(
                            context)
                            .height *
                            0.25,
                        decoration: BoxDecoration(
                          gradient:
                          LinearGradient(
                            colors: [
                              Colors.transparent,
                              Color(0xAA000000)
                            ],
                            stops: [0, 1],
                            begin:
                            AlignmentDirectional(
                                0, -1),
                            end:
                            AlignmentDirectional(
                                0, 1),
                          ),
                          borderRadius:
                          BorderRadius.only(
                            bottomLeft:
                            Radius.circular(
                                0),
                            bottomRight:
                            Radius.circular(
                                0),
                            topLeft:
                            Radius.circular(
                                10),
                            topRight:
                            Radius.circular(
                                10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional
                      .fromSTEB(6, 6, 6, 6),
                  child: AutoSizeText(
                    'كيف تستخدم تطبيقات الذكاء الاصطناعي في التسويق 2024 لتضاعف الإنتاجية؟ \t\t\t',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(
                        context)
                        .displaySmall
                        .override(
                      fontFamily:
                      FlutterFlowTheme.of(
                          context)
                          .displaySmallFamily,
                      fontSize: 26,
                      fontWeight:
                      FontWeight.bold,
                      useGoogleFonts: GoogleFonts
                          .asMap()
                          .containsKey(
                          FlutterFlowTheme.of(
                              context)
                              .displaySmallFamily),
                      lineHeight: 1.3,
                    ),
                    minFontSize: 20,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional
                        .fromSTEB(6, 6, 6, 6),
                    child: AutoSizeText(
                      '“إنتاجية أكثر، في وقت أقل” مطلب هذا العصر. ولا يعني هذا المطلب مضاعفة الجهد أو تقليله، بل توظيف الجهد البشري في الأشياء الأكثر حاجة إليه، والتي لا تزال الآلة غير قادرة على القيام بها. فكيف تساعدك تطبيقات الذكاء الاصطناعي في التسويق على تحقيق هذا الهدف؟  في العملية التسويقية توجد الكثير',
                      textAlign: TextAlign.end,
                      style: FlutterFlowTheme.of(
                          context)
                          .labelLarge
                          .override(
                        fontFamily:
                        FlutterFlowTheme.of(
                            context)
                            .labelLargeFamily,
                        fontSize: 20,
                        useGoogleFonts: GoogleFonts
                            .asMap()
                            .containsKey(
                            FlutterFlowTheme.of(
                                context)
                                .labelLargeFamily),
                        lineHeight: 1.3,
                      ),
                      minFontSize: 16,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color:
                  FlutterFlowTheme.of(context)
                      .secondaryText,
                ),
                Align(
                  alignment:
                  AlignmentDirectional(1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional
                        .fromSTEB(0, 0, 6, 6),
                    child: Text(
                      'فبراير 11, 2024',
                      style: FlutterFlowTheme.of(
                          context)
                          .bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    else return SizedBox();
  }
}
