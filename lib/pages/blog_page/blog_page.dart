
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketika_website/components/gradient_button/gradient_button_widget.dart';
import 'package:marketika_website/components/top_nav/top_nav_widget.dart';

import 'blog_page_model.dart';
export 'blog_page_model.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({
    super.key,
  });

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage>
    with TickerProviderStateMixin {
  late BlogPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, -70),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 50),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 50),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 175.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 175.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 175.ms,
          duration: 600.ms,
          begin: const Offset(0, 20),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 175.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 175.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 175.ms,
          duration: 600.ms,
          begin: const Offset(0, 20),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 175.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 175.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 175.ms,
          duration: 600.ms,
          begin: const Offset(0, 20),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 175.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 175.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 175.ms,
          duration: 600.ms,
          begin: const Offset(0, 20),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 250.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: const Offset(0, 50),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      /*if (widget.productRef?.userRef != currentUserReference) {
        await ActivityRecord.collection.doc().set({
          ...createActivityRecordData(
            title: 'New viewed item!',
            content:
            '${currentUserDisplayName} has viewed your item ${widget.productRef?.name}',
            sentAt: getCurrentTimestamp,
            productRef: widget.productRef?.reference,
          ),
          ...mapToFirestore(
            {
              'userList': [widget.productRef?.userRef],
              'unreadByUser': [widget.productRef?.userRef],
            },
          ),
        });
      } else {
        return;
      }*/
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.topNavModel,
                updateCallback: () => setState(() {}),
                child: const TopNavWidget(),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                          child: Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(
                              maxWidth: 1170,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              4, 12, 0, 12),
                                          child: Container(
                                            width: double.infinity,
                                            height: 44,
                                            decoration: BoxDecoration(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                            ),
                                            child: SingleChildScrollView(
                                              scrollDirection:
                                              Axis.horizontal,
                                              child: Row(
                                                mainAxisSize:
                                                MainAxisSize.max,
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .gradientButtonModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                    GradientButtonWidget(
                                                      action: () async {

                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        12, 0, 12, 0),
                                                    child: Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .secondaryText,
                                                      size: 16,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 0, 16, 0),
                                                    child: Container(
                                                      height: 32,
                                                      decoration:
                                                      BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .of(context)
                                                            .accent1,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(12),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .primary,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      alignment:
                                                      const AlignmentDirectional(
                                                          0, 0),
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16,
                                                            0, 16, 0),
                                                        child: AutoSizeText(
                                                          'كيف تستخدم تطبيقات الذكاء الاصطناعي في التسويق 2024 لتضاعف الإنتاجية؟',
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily,
                                                            letterSpacing:
                                                            0,
                                                            useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                                .containsKey(
                                                                FlutterFlowTheme.of(context)
                                                                    .bodyMediumFamily),
                                                          ),
                                                          minFontSize: 8,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                            'rowOnPageLoadAnimation']!),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              4, 0, 4, 70),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 2,
                                                  color: Color(0x520E151B),
                                                  offset: Offset(
                                                    0.0,
                                                    1,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                              BorderRadius.circular(12),
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize:
                                                MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.all(16),
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              0,
                                                              0,
                                                              0,
                                                              16),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Expanded(
                                                                child: Hero(
                                                                  tag:
                                                                  'productMain',
                                                                  transitionOnUserGestures:
                                                                  true,
                                                                  child:
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        10),
                                                                    child:
                                                                    CachedNetworkImage(
                                                                      fadeInDuration:
                                                                      const Duration(milliseconds: 500),
                                                                      fadeOutDuration:
                                                                      const Duration(milliseconds: 500),
                                                                      imageUrl:
                                                                      'https://picsum.photos/400',
                                                                      width:
                                                                      400,
                                                                      height:
                                                                      400,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (responsiveVisibility(
                                                                context:
                                                                context,
                                                                phone: false,
                                                                tablet: false,
                                                              ))
                                                                Expanded(
                                                                  child:
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        24,
                                                                        12,
                                                                        0,
                                                                        0),
                                                                    child:
                                                                    Column(
                                                                      mainAxisSize:
                                                                      MainAxisSize.max,
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment.start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                          MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'كيف تستخدم تطبيقات الذكاء الاصطناعي في التسويق 2024 لتضاعف الإنتاجية؟',
                                                                              style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                letterSpacing: 0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              12,
                                                                              0,
                                                                              12),
                                                                          child:
                                                                          Text(
                                                                            '122 stars',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              4,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            '35 reviews',
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              letterSpacing: 0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              4,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            '3568 views',
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              letterSpacing: 0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          height:
                                                                          36,
                                                                          thickness:
                                                                          1,
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      ],
                                                                    ).animateOnPageLoad(
                                                                        animationsMap['columnOnPageLoadAnimation1']!),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          tabletLandscape:
                                                          false,
                                                          desktop: false,
                                                        ))
                                                          Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                0,
                                                                12),
                                                            child: Column(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  'كيف تستخدم تطبيقات الذكاء الاصطناعي في التسويق 2024 لتضاعف الإنتاجية؟',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .headlineLarge
                                                                      .override(
                                                                    fontFamily:
                                                                    FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                    letterSpacing:
                                                                    0,
                                                                    useGoogleFonts:
                                                                    GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      0,
                                                                      12,
                                                                      0,
                                                                      12),
                                                                  child: Text(
                                                                    '122 stars',
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .titleLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      FlutterFlowTheme.of(context).titleLargeFamily,
                                                                      color:
                                                                      FlutterFlowTheme.of(context).primary,
                                                                      letterSpacing:
                                                                      0,
                                                                      useGoogleFonts:
                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      0,
                                                                      4,
                                                                      24,
                                                                      0),
                                                                  child: Text(
                                                                    '35 reviews',
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      FlutterFlowTheme.of(context).labelLargeFamily,
                                                                      letterSpacing:
                                                                      0,
                                                                      useGoogleFonts:
                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      0,
                                                                      4,
                                                                      24,
                                                                      0),
                                                                  child: Text(
                                                                    '3568 views',
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      FlutterFlowTheme.of(context).labelLargeFamily,
                                                                      letterSpacing:
                                                                      0,
                                                                      useGoogleFonts:
                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  height: 36,
                                                                  thickness:
                                                                  1,
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .alternate,
                                                                ),
                                                              ],
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                'columnOnPageLoadAnimation2']!),
                                                          ),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              0,
                                                              8,
                                                              0,
                                                              16),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                            Colors
                                                                .transparent,
                                                            onTap: () async {

                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .primaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                    0,
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryBackground,
                                                                    offset:
                                                                    const Offset(
                                                                      0.0,
                                                                      1,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8),
                                                                border: Border
                                                                    .all(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .alternate,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    8,
                                                                    8,
                                                                    12,
                                                                    8),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                      BorderRadius.circular(8),
                                                                      child: Image
                                                                          .network(
                                                                        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                                                                        width:
                                                                        70,
                                                                        height:
                                                                        70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                      Column(
                                                                        mainAxisSize:
                                                                        MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                            child: Text(
                                                                              'Maro younan',
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                letterSpacing: 0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                            child: Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                                                                  child: Text(
                                                                                    'Cairo, Egypt.',
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                      letterSpacing: 0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                              'containerOnPageLoadAnimation1']!),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                          MainAxisSize
                                                              .max,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    8,
                                                                    0,
                                                                    8,
                                                                    0),
                                                                child:
                                                                TextFormField(
                                                                  controller:
                                                                  _model
                                                                      .textController,
                                                                  focusNode:
                                                                  _model
                                                                      .textFieldFocusNode,
                                                                  autofocus:
                                                                  true,
                                                                  obscureText:
                                                                  false,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    labelText:
                                                                    'Write review...',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelMedium
                                                                        .override(
                                                                      fontFamily:
                                                                      FlutterFlowTheme.of(context).labelMediumFamily,
                                                                      letterSpacing:
                                                                      0,
                                                                      useGoogleFonts:
                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelMedium
                                                                        .override(
                                                                      fontFamily:
                                                                      FlutterFlowTheme.of(context).labelMediumFamily,
                                                                      letterSpacing:
                                                                      0,
                                                                      useGoogleFonts:
                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                                    enabledBorder:
                                                                    UnderlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color:
                                                                        FlutterFlowTheme.of(context).alternate,
                                                                        width:
                                                                        2,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(8),
                                                                    ),
                                                                    focusedBorder:
                                                                    UnderlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color:
                                                                        FlutterFlowTheme.of(context).primary,
                                                                        width:
                                                                        2,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(8),
                                                                    ),
                                                                    errorBorder:
                                                                    UnderlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color:
                                                                        FlutterFlowTheme.of(context).error,
                                                                        width:
                                                                        2,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(8),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                    UnderlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color:
                                                                        FlutterFlowTheme.of(context).error,
                                                                        width:
                                                                        2,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(8),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                    letterSpacing:
                                                                    0,
                                                                    useGoogleFonts:
                                                                    GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                                  validator: _model
                                                                      .textControllerValidator
                                                                      .asValidator(
                                                                      context),
                                                                ),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {

                                                              },
                                                              text:
                                                              'Leave Review',
                                                              options:
                                                              FFButtonOptions(
                                                                height: 44,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    24,
                                                                    0,
                                                                    24,
                                                                    0),
                                                                iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    0),
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .accent1,
                                                                textStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                    .bodyLarge
                                                                    .override(
                                                                  fontFamily:
                                                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                  letterSpacing:
                                                                  0,
                                                                  fontWeight:
                                                                  FontWeight.w500,
                                                                  useGoogleFonts:
                                                                  GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                ),
                                                                elevation: 0,
                                                                borderSide:
                                                                BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .primary,
                                                                  width: 2,
                                                                ),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    50),
                                                                hoverColor:
                                                                FlutterFlowTheme.of(
                                                                    context)
                                                                    .primary,
                                                                hoverTextColor:
                                                                FlutterFlowTheme.of(
                                                                    context)
                                                                    .info,
                                                                hoverElevation:
                                                                3,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 12, 0, 12),
                                                    child: RichText(
                                                      textScaler:
                                                      MediaQuery.of(
                                                          context)
                                                          .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                            'FlutterFlow',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              FlutterFlowTheme.of(context)
                                                                  .bodyMediumFamily,
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .primary,
                                                              letterSpacing:
                                                              0,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                                  .containsKey(
                                                                  FlutterFlowTheme.of(context).bodyMediumFamily),
                                                            ),
                                                          ),
                                                          const TextSpan(
                                                            text:
                                                            ' - Build Different',
                                                            style:
                                                            TextStyle(),
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMediumFamily,
                                                          letterSpacing:
                                                          0,
                                                          useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                              .containsKey(
                                                              FlutterFlowTheme.of(context)
                                                                  .bodyMediumFamily),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ))
                                                    Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0, 12,
                                                          0, 12),
                                                      child: Container(
                                                        width: 450,
                                                        height: 300,
                                                        decoration:
                                                        BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              8),
                                                        ),
                                                        child: const Align(
                                                          alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                          child:
                                                          FlutterFlowYoutubePlayer(
                                                            url:
                                                            'https://www.youtube.com/watch?v=C30hQ0ZSFoM',
                                                            width: 450,
                                                            height: 300,
                                                            autoPlay: false,
                                                            looping: true,
                                                            mute: false,
                                                            showControls:
                                                            true,
                                                            showFullScreen:
                                                            true,
                                                            strictRelatedVideos:
                                                            false,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0, 12,
                                                          0, 12),
                                                      child: Container(
                                                        width: 300,
                                                        height: 200,
                                                        decoration:
                                                        BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              8),
                                                        ),
                                                        child: const Align(
                                                          alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                          child:
                                                          FlutterFlowYoutubePlayer(
                                                            url:
                                                            'https://www.youtube.com/watch?v=C30hQ0ZSFoM',
                                                            width: 300,
                                                            height: 200,
                                                            autoPlay: false,
                                                            looping: true,
                                                            mute: false,
                                                            showControls:
                                                            true,
                                                            showFullScreen:
                                                            true,
                                                            strictRelatedVideos:
                                                            false,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Last 3 reviews',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                            fontFamily:
                                            FlutterFlowTheme.of(
                                                context)
                                                .titleLargeFamily,
                                            letterSpacing: 0,
                                            useGoogleFonts: GoogleFonts
                                                .asMap()
                                                .containsKey(
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .titleLargeFamily),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              4, 8, 4, 8),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor:
                                            Colors.transparent,
                                            onTap: () async {

                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 0,
                                                    color: FlutterFlowTheme
                                                        .of(context)
                                                        .primaryBackground,
                                                    offset: const Offset(
                                                      0.0,
                                                      1,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .alternate,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 12, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    Container(
                                                      width: 70,
                                                      height: 70,
                                                      decoration:
                                                      BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0,
                                                              2,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .primary,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.reviews_rounded,
                                                        color: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryText,
                                                        size: 32,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                16,
                                                                2,
                                                                0,
                                                                2),
                                                            child: Text(
                                                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                                                              style: FlutterFlowTheme.of(
                                                                  context)
                                                                  .labelMedium
                                                                  .override(
                                                                fontFamily:
                                                                FlutterFlowTheme.of(context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                0,
                                                                useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                    .containsKey(
                                                                    FlutterFlowTheme.of(context).labelMediumFamily),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation2']!),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              4, 8, 4, 8),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor:
                                            Colors.transparent,
                                            onTap: () async {

                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 0,
                                                    color: FlutterFlowTheme
                                                        .of(context)
                                                        .primaryBackground,
                                                    offset: const Offset(
                                                      0.0,
                                                      1,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .alternate,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 12, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    Container(
                                                      width: 70,
                                                      height: 70,
                                                      decoration:
                                                      BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0,
                                                              2,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .primary,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.reviews_rounded,
                                                        color: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryText,
                                                        size: 32,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                16,
                                                                2,
                                                                0,
                                                                2),
                                                            child: Text(
                                                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                                                              style: FlutterFlowTheme.of(
                                                                  context)
                                                                  .labelMedium
                                                                  .override(
                                                                fontFamily:
                                                                FlutterFlowTheme.of(context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                0,
                                                                useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                    .containsKey(
                                                                    FlutterFlowTheme.of(context).labelMediumFamily),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation3']!),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              4, 8, 4, 8),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor:
                                            Colors.transparent,
                                            onTap: () async {

                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 0,
                                                    color: FlutterFlowTheme
                                                        .of(context)
                                                        .primaryBackground,
                                                    offset: const Offset(
                                                      0.0,
                                                      1,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .alternate,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 12, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    Container(
                                                      width: 70,
                                                      height: 70,
                                                      decoration:
                                                      BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0,
                                                              2,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .primary,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.reviews_rounded,
                                                        color: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryText,
                                                        size: 32,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                16,
                                                                2,
                                                                0,
                                                                2),
                                                            child: Text(
                                                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                                              style: FlutterFlowTheme.of(
                                                                  context)
                                                                  .labelMedium
                                                                  .override(
                                                                fontFamily:
                                                                FlutterFlowTheme.of(context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                0,
                                                                useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                    .containsKey(
                                                                    FlutterFlowTheme.of(context).labelMediumFamily),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation4']!),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              8, 10, 8, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'للتواصل',
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyLargeFamily,
                                                        letterSpacing:
                                                        0,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodyLargeFamily),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      const AlignmentDirectional(
                                                          1, 0),
                                                      child: InkWell(
                                                        splashColor: Colors
                                                            .transparent,
                                                        focusColor: Colors
                                                            .transparent,
                                                        hoverColor: Colors
                                                            .transparent,
                                                        highlightColor: Colors
                                                            .transparent,
                                                        onTap: () async {

                                                        },
                                                        child: Text(
                                                          'يلا نرغي',
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily,
                                                            letterSpacing:
                                                            0,
                                                            useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                                .containsKey(
                                                                FlutterFlowTheme.of(context)
                                                                    .bodyMediumFamily),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'من نحن',
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyLargeFamily,
                                                        letterSpacing:
                                                        0,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodyLargeFamily),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      const AlignmentDirectional(
                                                          1, 0),
                                                      child: Text(
                                                        'عن ماركتيكا',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMediumFamily,
                                                          letterSpacing:
                                                          0,
                                                          useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                              .containsKey(
                                                              FlutterFlowTheme.of(context)
                                                                  .bodyMediumFamily),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      const AlignmentDirectional(
                                                          1, 0),
                                                      child: Text(
                                                        'رحلتي',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMediumFamily,
                                                          letterSpacing:
                                                          0,
                                                          useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                              .containsKey(
                                                              FlutterFlowTheme.of(context)
                                                                  .bodyMediumFamily),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'مقالات',
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyLargeFamily,
                                                        letterSpacing:
                                                        0,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodyLargeFamily),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      const AlignmentDirectional(
                                                          1, 0),
                                                      child: Text(
                                                        'ادوات التسويق',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMediumFamily,
                                                          letterSpacing:
                                                          0,
                                                          useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                              .containsKey(
                                                              FlutterFlowTheme.of(context)
                                                                  .bodyMediumFamily),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      const AlignmentDirectional(
                                                          1, 0),
                                                      child: Text(
                                                        'منصات التسوق',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMediumFamily,
                                                          letterSpacing:
                                                          0,
                                                          useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                              .containsKey(
                                                              FlutterFlowTheme.of(context)
                                                                  .bodyMediumFamily),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      const AlignmentDirectional(
                                                          1, 0),
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0,
                                                            0, 0, 4),
                                                        child: Text(
                                                          'Tips & Tricks',
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily,
                                                            letterSpacing:
                                                            0,
                                                            useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                                .containsKey(
                                                                FlutterFlowTheme.of(context)
                                                                    .bodyMediumFamily),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      const AlignmentDirectional(
                                                          1, 0),
                                                      child: Text(
                                                        'Case Study',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMediumFamily,
                                                          letterSpacing:
                                                          0,
                                                          useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                              .containsKey(
                                                              FlutterFlowTheme.of(context)
                                                                  .bodyMediumFamily),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                              Colors.transparent,
                                              onTap: () async {

                                              },
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryBackground,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.asset(
                                                      'assets/images/facebook.png',
                                                    ).image,
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 8, 0),
                                              child: InkWell(
                                                splashColor:
                                                Colors.transparent,
                                                focusColor:
                                                Colors.transparent,
                                                hoverColor:
                                                Colors.transparent,
                                                highlightColor:
                                                Colors.transparent,
                                                onTap: () async {

                                                },
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .of(context)
                                                        .secondaryBackground,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.asset(
                                                        'assets/images/instagram.png',
                                                      ).image,
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                              Colors.transparent,
                                              onTap: () async {

                                              },
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryBackground,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.asset(
                                                      'assets/images/tik-tok.png',
                                                    ).image,
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1, 1),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 32),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0,
                                                2,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                          BorderRadius.circular(12),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 5,
                                              sigmaY: 2,
                                            ),
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .accent4,
                                                borderRadius:
                                                BorderRadius.circular(12),
                                              ),
                                              child: Icon(
                                                Icons.star_rounded,
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .primary,
                                                size: 32,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation5']!),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
