import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class AdCardWidget extends StatefulWidget {
  const AdCardWidget({super.key, required this.imageUrl, required this.title, required this.subTitle, required this.pageUrl,});

  final String imageUrl;
  final String title;
  final String subTitle;
  final String pageUrl;

  @override
  State<AdCardWidget> createState() => _AdCardWidgetState();
}

class _AdCardWidgetState extends State<AdCardWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    if (responsiveVisibility(
      context: context,
      phone: false,
    )) {
      return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor:
      Colors.transparent,
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(widget.pageUrl))) {
          await launchUrl(Uri.parse(widget.pageUrl));
        } else {
          throw 'Could not launch ${widget.pageUrl}';
        }
      },
      onHover: (bool hovering) {
        setState(() {
          isHover = hovering;
        });
      },
      child: AnimatedContainer(
        width: isHover?220:200,
        height: isHover?MediaQuery.sizeOf(context)
            .height *
            0.3:
        MediaQuery.sizeOf(context)
            .height *
            0.2,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              widget.imageUrl,
            ),
          ),
          gradient: const LinearGradient(
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
        duration: const Duration(microseconds: 300),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize:
            MainAxisSize.max,
            mainAxisAlignment:
            MainAxisAlignment.end,
            crossAxisAlignment:
            CrossAxisAlignment
                .start,
            children: [
              if(widget.title.isNotEmpty || widget.subTitle.isNotEmpty)Container(
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
                  const EdgeInsets.all(
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
                        widget.title,
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
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional
                            .fromSTEB(
                            0,
                            4,
                            0,
                            0),
                        child: Text(
                          widget.subTitle,
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
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
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
    } else if (responsiveVisibility(
      context: context,
      tablet: false,
      tabletLandscape: false,
      desktop: false,
    )) {
      return InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(widget.pageUrl))) {
            await launchUrl(Uri.parse(widget.pageUrl));
          } else {
            throw 'Could not launch ${widget.pageUrl}';
          }
        },
        onHover: (bool isHover) async {
          setState(() {
            isHover = isHover;
          });
        },
        child: AnimatedContainer(
          width: isHover ? 220 : 200,
          height: isHover
              ? MediaQuery.sizeOf(context).height * 0.3
              : MediaQuery.sizeOf(context).height * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                widget.imageUrl,
              ),
            ),
            gradient: const LinearGradient(
              colors: [Color(0x0014181B), Color(0x9914181B)],
              stops: [0.4, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(microseconds: 300),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.title.isNotEmpty)
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent4,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
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
    } else {
      return const SizedBox();
    }
  }
}
