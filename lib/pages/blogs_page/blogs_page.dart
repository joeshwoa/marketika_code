import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketika_website/components/blog_card/blog_card_widget.dart';
import 'package:marketika_website/components/footer/footer_widget.dart';
import 'package:marketika_website/components/top_nav/top_nav_widget.dart';
import 'package:marketika_website/main.dart';

import 'blogs_page_model.dart';
export 'blogs_page_model.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({super.key, required this.name, required this.type, required this.index});

  final String name;
  final String type;
  final int index;

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  late BlogsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late ScrollController _scrollController;
  List<BlogCardWidget> _blogCards = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));

    _scrollController = ScrollController()..addListener(_scrollListener);
    _fetchBlogCards();
  }

  @override
  void dispose() {
    _model.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 50 && !isLoading) {
      _fetchBlogCards();
    }
  }

  Future<void> _fetchBlogCards() async {
    setState(() {
      isLoading = true;
    });

    final data = await supabase.from('blogs').select('id, imageUrl, title, description, created_at').eq('type', widget.type).range(_blogCards.length, _blogCards.length + 9).order('created_at');

    setState(() {
      final blogCards = data
          .map((blogCardData) => BlogCardWidget(
        id: blogCardData['id'] as int,
        imageUrl: blogCardData['imageUrl'] as String,
        title: blogCardData['title'] as String,
        description: blogCardData['description'] as String,
        publishDate: DateTime.parse(blogCardData['created_at'] as String),
      ))
          .toList();

      _blogCards.addAll(blogCards);
      isLoading = false;
    });
  }

  // Helper methods to get crossAxisCount and childAspectRatio based on screen size
  int getCrossAxisCount(BuildContext context) {
    if (responsiveVisibility(context: context, phone: false, tablet: false, tabletLandscape: false)) {
      return 3;
    } else if (responsiveVisibility(context: context, phone: false, desktop: false)) {
      return 2;
    } else {
      return 1;
    }
  }

  double getChildAspectRatio(BuildContext context) {
    if (responsiveVisibility(context: context, phone: false, tablet: false, tabletLandscape: false)) {
      return 0.8;
    } else if (responsiveVisibility(context: context, phone: false, desktop: false)) {
      return 0.8;
    } else {
      return 1.1;
    }
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
                child: TopNavWidget(
                  index: widget.index,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    widget.name,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                      fontSize: 26,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: !(isLoading && _blogCards.isEmpty)
                    ? Container(
                      decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                      child: CustomScrollView(
                                        controller: _scrollController,
                                        slivers: [
                                          if(_blogCards.isNotEmpty)SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: getCrossAxisCount(context),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: getChildAspectRatio(context),
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return _blogCards[index];
                          },
                          childCount: _blogCards.length,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(top: _blogCards.isEmpty?MediaQuery.sizeOf(context).height*0.4:0),
                          child: FooterWidget(),
                        ),
                      ),
                                        ],
                                      ),
                    )
                    : const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
