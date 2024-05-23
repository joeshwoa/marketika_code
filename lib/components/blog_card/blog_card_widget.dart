import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketika_website/pages/blog_page/blog_page.dart';


class BlogCardWidget extends StatefulWidget {
  const BlogCardWidget({super.key, required this.id, required this.imageUrl, required this.title, required this.description, required this.publishDate,});

  final int id;
  final String imageUrl;
  final String title;
  final String description;
  final DateTime publishDate;

  @override
  State<BlogCardWidget> createState() => _BlogCardWidgetState();
}

class _BlogCardWidgetState extends State<BlogCardWidget> {
  bool isHover = false;
  // Create a DateFormat instance with the desired locale and pattern
  
  String month = '';
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting('ar', null).then((_) {
      DateFormat formatter = DateFormat.MMMM('ar');
      setState(() {
        month = formatter.format(widget.publishDate);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    if (responsiveVisibility(
      context: context,
      phone: false,
      desktop: false,
    )) {
      return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlogPage(
                id: widget.id,
              ),
            ),
          );
        },
        onHover: (bool hovering) {
          setState(() {
            isHover = hovering;
          });
        },
        child: Padding(
          padding: isHover?
          const EdgeInsets.only(bottom: 8.0):
          EdgeInsets.zero,
          child: Material(
            color: Colors.transparent,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(10),
            ),
            child: Container(
              width:
              isHover?
              MediaQuery.sizeOf(context).width *
                  0.31:
              MediaQuery.sizeOf(context).width *
                  0.30,
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
                    decoration: const BoxDecoration(
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
                          const BorderRadius.only(
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
                            fadeInDuration: const Duration(milliseconds: 500),
                            fadeOutDuration: const Duration(milliseconds: 500),
                            imageUrl: widget.imageUrl,
                            width: double.infinity,
                            height:
                            MediaQuery.sizeOf(
                                context)
                                .height *
                                0.18,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => Center(child: Icon(Icons.broken_image_rounded, size: 50, color: FlutterFlowTheme.of(context).primaryText,),),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(
                              context)
                              .height *
                              0.18,
                          decoration: const BoxDecoration(
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
                    padding: const EdgeInsetsDirectional
                        .fromSTEB(6, 6, 6, 6),
                    child: AutoSizeText(
                      widget.title,
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
                      padding: const EdgeInsetsDirectional
                          .fromSTEB(6, 6, 6, 6),
                      child: AutoSizeText(
                        widget.description,
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
                    const AlignmentDirectional(1, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional
                          .fromSTEB(0, 0, 6, 6),
                      child: Text(
                        '${widget.publishDate.year} ,${widget.publishDate.day} $month',
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
      ),
    );
    } else if (responsiveVisibility(
      context: context,
      tablet: false,
      tabletLandscape: false,
      desktop: false,
    )) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlogPage(
                    id: widget.id,
                ),
              ),
            );
          },
          onHover: (bool hovering) {
            setState(() {
              isHover = hovering;
            });
          },
          child: Padding(
            padding:
                isHover ? const EdgeInsets.only(left: 8.0) : EdgeInsets.zero,
            child: Material(
              color: Colors.transparent,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: MediaQuery.sizeOf(context).height * 0.4,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: isHover
                          ? MediaQuery.sizeOf(context).height * 0.18
                          : MediaQuery.sizeOf(context).height * 0.16,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 500),
                              fadeOutDuration:
                                  const Duration(milliseconds: 500),
                              imageUrl: widget.imageUrl,
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.18,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Center(child: Icon(Icons.broken_image_rounded, size: 50, color: FlutterFlowTheme.of(context).primaryText,),),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.18,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.transparent, Color(0xAA000000)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                      child: AutoSizeText(
                        widget.title,
                        textAlign: TextAlign.end,
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displaySmallFamily,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displaySmallFamily),
                                  lineHeight: 1.3,
                                ),
                        minFontSize: 20,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 6, 6),
                        child: Text(
                          '${widget.publishDate.year} ,${widget.publishDate.day} $month',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else if (responsiveVisibility(
      context: context,
      phone: false,
      tablet: false,
      tabletLandscape: false,
    )) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlogPage(
                    id: widget.id,
                ),
              ),
            );
          },
          onHover: (bool hovering) {
            setState(() {
              isHover = hovering;
            });
          },
          child: Padding(
            padding:
                isHover ? const EdgeInsets.only(bottom: 8.0) : EdgeInsets.zero,
            child: Material(
              color: Colors.transparent,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: isHover
                    ? MediaQuery.sizeOf(context).width * 0.25
                    : MediaQuery.sizeOf(context).width * 0.23,
                height: MediaQuery.sizeOf(context).height * 0.8,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.25,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 500),
                              fadeOutDuration:
                                  const Duration(milliseconds: 500),
                              imageUrl: widget.imageUrl,
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.25,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Center(child: Icon(Icons.broken_image_rounded, size: 50, color: FlutterFlowTheme.of(context).primaryText,),),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.25,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.transparent, Color(0xAA000000)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                      child: AutoSizeText(
                        widget.title,
                        textAlign: TextAlign.end,
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displaySmallFamily,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displaySmallFamily),
                                  lineHeight: 1.3,
                                ),
                        minFontSize: 20,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                        child: AutoSizeText(
                          widget.description,
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelLargeFamily,
                                fontSize: 20,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelLargeFamily),
                                lineHeight: 1.3,
                              ),
                          minFontSize: 16,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 6, 6),
                        child: Text(
                          '${widget.publishDate.year} ,${widget.publishDate.day} $month',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
