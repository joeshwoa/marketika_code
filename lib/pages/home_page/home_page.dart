import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketika_website/components/ad_card/ad_card_widget.dart';
import 'package:marketika_website/components/blog_card/blog_card_widget.dart';
import 'package:marketika_website/components/footer/footer_widget.dart';
import 'package:marketika_website/components/top_nav/top_nav_widget.dart';
import 'package:marketika_website/main.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final searchFormKey = GlobalKey<FormState>();
  final subscribeFormKey = GlobalKey<FormState>();

  final animationsMap = {
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        SaturateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        SaturateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  List<AdCardWidget> _adCards = [];
  bool loadAdCards = false;
  List<BlogCardWidget> _blogCards = [];
  List<BlogCardWidget> _searchBlogCards = [];
  bool loadBlogCards = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.searchController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();
    _model.searchControllerValidator = (context, value) {
      if(value!.isEmpty) {
        return 'خانة البحث فارغة';
      }
      return null;
    };

    _model.nameController ??= TextEditingController();
    _model.nameFieldFocusNode ??= FocusNode();
    _model.nameControllerValidator = (context, value) {
      if(value!.isEmpty) {
        return 'خانة الاسم فارغة';
      }
      return null;
    };

    _model.emailController ??= TextEditingController();
    _model.emailFieldFocusNode ??= FocusNode();
    _model.emailControllerValidator = (context, value) {
      if(value!.isEmpty) {
        return 'خانة البريد الالكتروني فارغة';
      }
      return null;
    };

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));

    // Fetch Ad Cards
    _fetchAdCards();

    // Fetch last three blog cards
    _fetchBlogCards();
  }

  Future<void> _fetchAdCards() async {
    setState(() {
      loadAdCards = true;
    });
    // Make a request to get all Ad Cards from Supabase
    final data = await supabase
        .from('ads')
        .select('imageUrl, title, subTitle, pageUrl');

    setState(() {
      _adCards = data
          .map((adCardData) => AdCardWidget(
        imageUrl: adCardData['imageUrl'] as String,
        title: adCardData['title'] as String,
        subTitle: adCardData['subTitle'] as String,
        pageUrl: adCardData['pageUrl'] as String,
      ))
          .toList();
      loadAdCards = false;
    });
  }

  Future<void> _fetchBlogCards() async {
    setState(() {
      loadBlogCards = true;
    });
    // Make a request to get last three blog cards from Supabase
    final data = await supabase
        .from('blogs')
        .select('id, imageUrl, title, description, created_at')
        .order('created_at', ascending: false)
        .limit(3);

    setState(() {
      _blogCards = data
          .map((blogCardData) => BlogCardWidget(
        id: blogCardData['id'] as int,
        imageUrl: blogCardData['imageUrl'] as String,
        title: blogCardData['title'] as String,
        description: blogCardData['description'] as String,
        publishDate: DateTime.parse(blogCardData['created_at'] as String),
      ))
          .toList();
      loadBlogCards = false;
    });
  }

  Future<void> _searchBlogs() async {
    setState(() {
      _searchBlogCards.clear();
    });
    // Make a request to get last three blog cards from Supabase
    final data = await supabase
        .from('blogs')
        .select('id, imageUrl, title, description, created_at')
        .or('author_name.ilike.%${_model.searchController.text}%,author_location.ilike.%${_model.searchController.text}%,title.ilike.%${_model.searchController.text}%,description.ilike.%${_model.searchController.text}%')
        .order('created_at', ascending: false)
        .limit(3);

    setState(() {
      _searchBlogCards = data
          .map((blogCardData) => BlogCardWidget(
        id: blogCardData['id'] as int,
        imageUrl: blogCardData['imageUrl'] as String,
        title: blogCardData['title'] as String,
        description: blogCardData['description'] as String,
        publishDate: DateTime.parse(blogCardData['created_at'] as String),
      ))
          .toList();
    });
  }

  void subscribe() async {
    // Get the name and email from the text fields
    String name = _model.nameController.text;
    String email = _model.emailController.text;
    bool findError = false;

    // Perform the insert operation
    await supabase
        .from('subscribers')
        .insert({'name': name, 'email': email}).catchError((error){
      Fluttertoast.showToast(
          msg: 'Error inserting subscriber: $error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          webBgColor: "linear-gradient(to right, #0000008a, #0000008a)",
          webPosition: "center",
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0
      );

      findError = true;
    });

    if(!findError) {
      _model.nameController!.clear();
      _model.emailController!.clear();
      Fluttertoast.showToast(
          msg: 'Subscriber inserted successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          webBgColor: "linear-gradient(to right, #0000008a, #0000008a)",
          webPosition: "center",
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
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
                child: const TopNavWidget(index: 0,),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Form(
                              key: searchFormKey,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: const Color(0x00FFFFFF),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.search_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 8, 0),
                                      child: TextFormField(
                                        controller: _model.searchController,
                                        focusNode: _model.searchFieldFocusNode,
                                        autofocus: false,
                                        textInputAction: TextInputAction.search,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'ابحث',
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          alignLabelWithHint: false,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .alternate,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .primary,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.end,
                                        validator: _model.searchControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['rowOnPageLoadAnimation1']!),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                        ))
                          Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(200, 0, 200, 0),
                            child: Form(
                              key: searchFormKey,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
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
                                      if(_model.searchController!.text.isNotEmpty) {
                                        await _searchBlogs();
                                      }
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).primary,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: const Color(0x00FFFFFF),
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.search_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 8, 0),
                                      child: TextFormField(
                                        controller: _model.searchController,
                                        focusNode: _model.searchFieldFocusNode,
                                        autofocus: false,
                                        textInputAction: TextInputAction.search,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'ابحث',
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          alignLabelWithHint: false,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .alternate,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .primary,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.end,
                                        validator: _model.searchControllerValidator
                                            .asValidator(context),
                                        onFieldSubmitted: (value) async {
                                          if(_model.searchController!.text.isNotEmpty) {
                                            await _searchBlogs();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['rowOnPageLoadAnimation2']!),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                        ))
                          Align(
                            alignment: const AlignmentDirectional(0, -1),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                height: MediaQuery.sizeOf(context).height * 0.2,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0, -1),
                                      child: SizedBox(
                                        width:
                                        MediaQuery.sizeOf(context).width *
                                            0.8,
                                        height:
                                        MediaQuery.sizeOf(context).height *
                                            0.2,
                                        child: !loadAdCards?
                                        (_adCards.isNotEmpty?
                                        CarouselSlider.builder(
                                          itemBuilder: (context, index, realIndex) => _adCards[index],
                                          itemCount: _adCards.length,
                                          carouselController:
                                          _model.carouselController ??=
                                              CarouselController(),
                                          options: CarouselOptions(
                                            initialPage: 0,
                                            viewportFraction: 0.5,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.25,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            autoPlayAnimationDuration:
                                            const Duration(milliseconds: 800),
                                            autoPlayInterval: const Duration(
                                                milliseconds: (800 + 4000)),
                                            autoPlayCurve: Curves.linear,
                                            pauseAutoPlayInFiniteScroll: true,
                                            onPageChanged: (index, _) => _model
                                                .carouselCurrentIndex = index,
                                          ),
                                        ):
                                            const SizedBox()):
                                        const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                const Color(0x00FFFFFF),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                              ],
                                              stops: const [0, 1],
                                              begin: const AlignmentDirectional(1, 0),
                                              end: const AlignmentDirectional(-1, 0),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                const Color(0x00FFFFFF),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                              ],
                                              stops: const [0, 1],
                                              begin:
                                              const AlignmentDirectional(-1, 0),
                                              end: const AlignmentDirectional(1, 0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                          Align(
                            alignment: const AlignmentDirectional(0, -1),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.95,
                                height: MediaQuery.sizeOf(context).height * 0.1,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0, -1),
                                      child: SizedBox(
                                        width:
                                        MediaQuery.sizeOf(context).width *
                                            0.95,
                                        height:
                                        MediaQuery.sizeOf(context).height *
                                            0.1,
                                        child: !loadAdCards?
                                            (_adCards.isNotEmpty?
                                            CarouselSlider.builder(
                                          itemBuilder: (context, index, realIndex) => _adCards[index],
                                          itemCount: _adCards.length,
                                          carouselController:
                                          _model.carouselController ??=
                                              CarouselController(),
                                          options: CarouselOptions(
                                            initialPage: 0,
                                            viewportFraction: 0.5,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.25,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            autoPlayAnimationDuration:
                                            const Duration(milliseconds: 800),
                                            autoPlayInterval: const Duration(
                                                milliseconds: (800 + 4000)),
                                            autoPlayCurve: Curves.linear,
                                            pauseAutoPlayInFiniteScroll: true,
                                            onPageChanged: (index, _) => _model
                                                .carouselCurrentIndex = index,
                                          ),
                                        ):
                                                const SizedBox()):
                                        const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                const Color(0x00FFFFFF),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                              ],
                                              stops: const [0, 1],
                                              begin: const AlignmentDirectional(1, 0),
                                              end: const AlignmentDirectional(-1, 0),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                const Color(0x00FFFFFF),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                              ],
                                              stops: const [0, 1],
                                              begin:
                                              const AlignmentDirectional(-1, 0),
                                              end: const AlignmentDirectional(1, 0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                        ))
                          Align(
                            alignment: const AlignmentDirectional(1, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 16, 12, 16),
                              child: Text(
                                _searchBlogCards.isNotEmpty?'نتائج البحث':'احدث المقالات',
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
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
                          tablet: false,
                          tabletLandscape: false,
                        ))
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: MediaQuery.sizeOf(context).height * 0.8,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: _searchBlogCards.isNotEmpty? Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: _searchBlogCards,
                              ):
                              !loadBlogCards? Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: _blogCards,
                              ):
                              const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          desktop: false,
                        ))
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.98,
                            height: MediaQuery.sizeOf(context).height * 0.5,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: _searchBlogCards.isNotEmpty? Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: _searchBlogCards,
                              ):
                              !loadBlogCards? Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: _blogCards,
                              ):
                              const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.98,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: _searchBlogCards.isNotEmpty? Column(
                                mainAxisSize: MainAxisSize.max,
                                children: _searchBlogCards,
                              ):
                              !loadBlogCards? Column(
                                mainAxisSize: MainAxisSize.max,
                                children: _blogCards,
                              ):
                              const Center(
                                child: CircularProgressIndicator(),
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
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.30,
                              decoration: BoxDecoration(
                                color: const Color(0x676F61EF),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(5),
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(20),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Form(
                                  key: subscribeFormKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'تابع احدث المقالات',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .titleMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8, 4, 8, 4),
                                        child: TextFormField(
                                          controller: _model.nameController,
                                          focusNode: _model.nameFieldFocusNode,
                                          autofocus: false,
                                          autofillHints: const [AutofillHints.name],
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'الاسم',
                                            labelStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                            hintStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          textAlign: TextAlign.end,
                                          keyboardType: TextInputType.name,
                                          validator: _model
                                              .nameControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8, 4, 8, 4),
                                        child: TextFormField(
                                          controller: _model.emailController,
                                          focusNode: _model.emailFieldFocusNode,
                                          autofocus: false,
                                          autofillHints: const [AutofillHints.email],
                                          textInputAction: TextInputAction.done,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'البريد الالكتروني',
                                            labelStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                            hintStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(5),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(5),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(5),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(5),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          textAlign: TextAlign.end,
                                          keyboardType:
                                          TextInputType.emailAddress,
                                          validator: _model
                                              .emailControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: subscribe,
                                        text: 'تابع الان',
                                        options: FFButtonOptions(
                                          height: 40,
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              24, 0, 24, 0),
                                          iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                            fontFamily:
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily,
                                            color: Colors.white,
                                            useGoogleFonts: GoogleFonts
                                                .asMap()
                                                .containsKey(
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .titleSmallFamily),
                                          ),
                                          elevation: 3,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          desktop: false,
                        ))
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              height: MediaQuery.sizeOf(context).height * 0.18,
                              decoration: BoxDecoration(
                                color: const Color(0x676F61EF),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(5),
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(20),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Form(
                                  key: subscribeFormKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'تابع احدث المقالات',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .titleMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8, 4, 8, 4),
                                        child: TextFormField(
                                          controller: _model.nameController,
                                          focusNode: _model.nameFieldFocusNode,
                                          autofocus: false,
                                          autofillHints: const [AutofillHints.name],
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'الاسم',
                                            labelStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                            hintStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          textAlign: TextAlign.end,
                                          keyboardType: TextInputType.name,
                                          validator: _model
                                              .nameControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8, 4, 8, 4),
                                        child: TextFormField(
                                          controller: _model.emailController,
                                          focusNode: _model.emailFieldFocusNode,
                                          autofocus: false,
                                          autofillHints: const [AutofillHints.email],
                                          textInputAction: TextInputAction.done,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'البريد الالكتروني',
                                            labelStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                            hintStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(5),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(5),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(5),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(5),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          textAlign: TextAlign.end,
                                          keyboardType:
                                          TextInputType.emailAddress,
                                          validator: _model
                                              .emailControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: subscribe,
                                        text: 'تابع الان',
                                        options: FFButtonOptions(
                                          height: 40,
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              24, 0, 24, 0),
                                          iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                            fontFamily:
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily,
                                            color: Colors.white,
                                            useGoogleFonts: GoogleFonts
                                                .asMap()
                                                .containsKey(
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .titleSmallFamily),
                                          ),
                                          elevation: 3,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                        ))
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              height: MediaQuery.sizeOf(context).height * 0.4,
                              decoration: BoxDecoration(
                                color: const Color(0x676F61EF),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(5),
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(20),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Form(
                                  key: subscribeFormKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'تابع احدث المقالات',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .titleMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8, 4, 8, 4),
                                        child: TextFormField(
                                          controller: _model.nameController,
                                          focusNode: _model.nameFieldFocusNode,
                                          autofocus: false,
                                          autofillHints: const [AutofillHints.name],
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'الاسم',
                                            labelStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                            hintStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          textAlign: TextAlign.end,
                                          keyboardType: TextInputType.name,
                                          validator: _model
                                              .nameControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8, 4, 8, 4),
                                        child: TextFormField(
                                          controller: _model.emailController,
                                          focusNode: _model.emailFieldFocusNode,
                                          autofocus: false,
                                          autofillHints: const [AutofillHints.email],
                                          textInputAction: TextInputAction.done,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'البريد الالكتروني',
                                            labelStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                            hintStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(5),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(5),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(5),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                                width: 2,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(5),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          textAlign: TextAlign.end,
                                          keyboardType:
                                          TextInputType.emailAddress,
                                          validator: _model
                                              .emailControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: subscribe,
                                        text: 'تابع الان',
                                        options: FFButtonOptions(
                                          height: 40,
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              24, 0, 24, 0),
                                          iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                            fontFamily:
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily,
                                            color: Colors.white,
                                            useGoogleFonts: GoogleFonts
                                                .asMap()
                                                .containsKey(
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .titleSmallFamily),
                                          ),
                                          elevation: 3,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        const FooterWidget()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
