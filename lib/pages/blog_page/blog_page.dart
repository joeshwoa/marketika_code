
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketika_website/components/footer/footer_widget.dart';
import 'package:marketika_website/components/gradient_button/gradient_button_widget.dart';
import 'package:marketika_website/components/top_nav/top_nav_widget.dart';
import 'package:marketika_website/main.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:flutter/foundation.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'blog_page_model.dart';
export 'blog_page_model.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({
    super.key,
    required this.id,
  });

  final int id;

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

  QuillController _controller = QuillController.basic();

  String imageUrl = '';
  String title = '';
  String description = '';
  int stars = 0;
  int reviews = 0;
  int views = 0;
  List<String> reviews_text = [];
  String videoUrl = '';
  String author_imageUrl = '';
  String author_name = '';
  String author_location = '';
  String author_meta = '';
  String description_meta = '';
  String keywords_meta = '';
  String ogTitle_meta = '';
  String ogDescription_meta = '';
  String ogImage_meta = '';

  bool isLoading = false;
  bool isSubmitting = false;

  late YoutubePlayerController youtubeController;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogPageModel());
    
    setState(() {
      isLoading = true;
    });

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {

      final data = await supabase.from('blogs').select().eq('id', widget.id);

      setState(() {
        imageUrl = data[0]['imageUrl'];
        title = data[0]['title'];
        description = data[0]['description'];
        stars = data[0]['stars'];
        reviews = data[0]['reviews'];
        views = data[0]['views'];
        views += 1;
        reviews_text = (data[0]['reviews_text'] as List<dynamic>).cast<String>();
        videoUrl = data[0]['videoUrl'];
        youtubeController = YoutubePlayerController.fromVideoId(
          videoId: YoutubePlayerController.convertUrlToId(videoUrl)!,
          autoPlay: false,
          params: YoutubePlayerParams(
            mute: false,
            showControls: true,
            showFullscreenButton: true,
          ),
        );
        _controller.document = Document.fromJson(jsonDecode(data[0]['content']));
        author_imageUrl = data[0]['author_imageUrl'];
        author_name = data[0]['author_name'];
        author_location = data[0]['author_location'];
        author_meta = data[0]['author_meta'];
        description_meta = data[0]['description_meta'];
        keywords_meta = data[0]['keywords_meta'];
        ogTitle_meta = data[0]['ogTitle_meta'];
        ogDescription_meta = data[0]['ogDescription_meta'];
        ogImage_meta = data[0]['ogImage_meta'];

        isLoading = false;
      });

      await supabase
          .from('blogs')
          .update({'views': views})
          .eq('id', widget.id);
    });



    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  Future<void> _submitReview() async {
    // Update reviews count in Supabase
    reviews+=1;
    reviews_text.add(_model.textController.text);
    await supabase
        .from('blogs')
        .update({
      'reviews_text': reviews_text,
      'reviews':reviews,
    })
        .eq('id', widget.id);
  
    // Clear review text field
    _model.textController!.clear();
  }
  
  Future<void> _sendStar() async {
    setState(() {
      isSubmitting = true;
      stars += 1;
    });
    
    await supabase
        .from('blogs')
        .update({'stars': stars})
        .eq('id', widget.id);

    setState(() {
      isSubmitting = false;
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(kIsWeb) {
      // Define MetaSEO object
      MetaSEO meta = MetaSEO();
      // add meta seo data for web app as you want
      meta.author(author: author_meta);
      meta.description(description: description_meta);
      meta.keywords(keywords: keywords_meta);
      meta.ogTitle(ogTitle: ogTitle_meta);
      meta.ogDescription(ogDescription: ogDescription_meta);
      meta.ogImage(ogImage: ogImage_meta);
    }
    
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: isLoading? 
          const Center(child: CircularProgressIndicator()) :
          Column(
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
                                                        Navigator.pop(context);
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
                                                        child: Column(
                                                          children: [
                                                            AutoSizeText(
                                                              title,
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
                                                          ],
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
                                                                      imageUrl,
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
                                                                        Text(
                                                                          title,
                                                                          style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                            fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                            letterSpacing: 0,
                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              12,
                                                                              0,
                                                                              12),
                                                                          child:
                                                                          Text(
                                                                            '$stars stars',
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
                                                                            '$reviews reviews',
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
                                                                            '$views views',
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
                                                                  title,
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
                                                                    '$stars stars',
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
                                                                    '$reviews reviews',
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
                                                                    '$views views',
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
                                                            /// todo: go to marina younan profile
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
                                                                      child: CachedNetworkImage(
                                                                        fadeInDuration:
                                                                        const Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                        const Duration(milliseconds: 500),
                                                                        imageUrl: author_imageUrl,
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
                                                                              author_name,
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
                                                                                    author_location,
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
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        12, 12, 12, 12),
                                                    child: QuillEditor.basic(
                                                      configurations: QuillEditorConfigurations(
                                                        controller: _controller,
                                                        readOnly: true,
                                                        sharedConfigurations: const QuillSharedConfigurations(
                                                          locale: Locale('ar'),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ))
                                                    videoUrl.isNotEmpty?
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
                                                        child: Align(
                                                          alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                          child:
                                                          YoutubePlayerScaffold(
                                                            controller: youtubeController,
                                                            aspectRatio: 450 / 300,autoFullScreen: false,
                                                            builder: (context, player) {
                                                              return Container(
                                                                width: 450,
                                                                height: 300,
                                                                decoration: BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      12),
                                                                ),
                                                                clipBehavior: Clip.antiAlias,
                                                                child: player,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ):
                                                    SizedBox(),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    videoUrl.isNotEmpty?
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
                                                        child: Align(
                                                          alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                          child:
                                                          FlutterFlowYoutubePlayer(
                                                            url:
                                                            videoUrl,
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
                                                    ):
                                                    SizedBox(),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
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
                                                              false,
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
                                                            await _submitReview();
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        if(reviews_text.length > 0)Text(
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
                                        if(reviews_text.length > 0)Padding(
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
                                                              reviews_text[reviews_text.length-1],
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
                                        if(reviews_text.length > 1)Padding(
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
                                                              reviews_text[reviews_text.length-2],
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
                                        if(reviews_text.length > 2)Padding(
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
                                                              reviews_text[reviews_text.length-3],
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
                                        FooterWidget()
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1, 1),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 32),
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
                                          if(!isSubmitting) {
                                            await _sendStar();
                                          }
                                        },
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
                                                child: isSubmitting? Center(child: CircularProgressIndicator(),):Icon(
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
