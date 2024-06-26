import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:marketika_website/components/nav_tab/nav_tab_widget.dart';
import 'package:marketika_website/dropdown/dropdown_notifications/dropdown_notifications_widget.dart';
import 'package:marketika_website/main.dart';
import 'package:marketika_website/pages/about_marketika/about_marketika.dart';
import 'package:marketika_website/pages/blogs_page/blogs_page.dart';
import 'package:marketika_website/pages/home_page/home_page.dart';

import '/components/main_logo/main_logo_widget.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:badges/badges.dart' as badges;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'top_nav_model.dart';
export 'top_nav_model.dart';

class TopNavWidget extends StatefulWidget {
  const TopNavWidget({super.key, this.index = -1});
  final int index;

  @override
  State<TopNavWidget> createState() => _TopNavWidgetState();
}

class _TopNavWidgetState extends State<TopNavWidget>
    with TickerProviderStateMixin {
  late TopNavModel _model;

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
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
    'textOnPageLoadAnimation2': AnimationInfo(
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
    'textOnPageLoadAnimation3': AnimationInfo(
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
    'textOnPageLoadAnimation4': AnimationInfo(
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
    'textOnPageLoadAnimation5': AnimationInfo(
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
    'textOnPageLoadAnimation6': AnimationInfo(
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
    'textOnPageLoadAnimation7': AnimationInfo(
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
    'textOnPageLoadAnimation8': AnimationInfo(
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
    'textOnPageLoadAnimation9': AnimationInfo(
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
    'textOnPageLoadAnimation10': AnimationInfo(
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
    'textOnPageLoadAnimation11': AnimationInfo(
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
    'textOnPageLoadAnimation12': AnimationInfo(
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
    'textOnPageLoadAnimation13': AnimationInfo(
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
    'textOnPageLoadAnimation14': AnimationInfo(
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
    'textOnPageLoadAnimation15': AnimationInfo(
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
    'textOnPageLoadAnimation16': AnimationInfo(
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
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FlipEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1,
          end: 2,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(-40, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FlipEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1,
          end: 2,
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FlipEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1,
          end: 2,
        ),
      ],
    ),
    'textOnPageLoadAnimation17': AnimationInfo(
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
    'textOnPageLoadAnimation18': AnimationInfo(
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
    'textOnPageLoadAnimation19': AnimationInfo(
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
    'textOnPageLoadAnimation20': AnimationInfo(
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
    'textOnPageLoadAnimation21': AnimationInfo(
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
    'textOnPageLoadAnimation22': AnimationInfo(
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
    'textOnPageLoadAnimation23': AnimationInfo(
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
    'textOnPageLoadAnimation24': AnimationInfo(
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

  List<Map<String, String>> notifications = [];
  bool loading = false;

  bool tabsIsOpen = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopNavModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((Theme.of(context).brightness == Brightness.dark) == true) {
        if (animationsMap['containerOnActionTriggerAnimation'] != null) {
          await animationsMap['containerOnActionTriggerAnimation']!
              .controller
              .reverse();
        }
      }
    });

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {

      setState(() {
        loading = true;
      });

      final data = await supabase.from('notifications').select('title, body').order('created_at');
      notifications = data
          .map((notification) => {
        'title': notification['title'] as String,
        'body': notification['body'] as String,
      }).toList();

      setState(() {
        loading = false;
      });
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
      anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ))
          Container(
            width: 200,
            height: 44,
            decoration: const BoxDecoration(),
          ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Container(
                        width: 24,
                        height: 44,
                        decoration: const BoxDecoration(),
                      ),
                    wrapWithModel(
                      model: _model.mainLogoModel,
                      updateCallback: () => setState(() {}),
                      child: const MainLogoWidget(),
                    ),
                  ],
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
              ))
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NavTabWidget(
                          title: 'الرئيسية',
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                          },
                          selected: widget.index == 0,
                        ),
                        NavTabWidget(
                          title: 'يلا نرغي',
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'يلا نرغي',type: 'talk',index: 1,),));
                          },
                          selected: widget.index == 1,
                        ),
                        NavTabWidget(
                          title: 'ادوات',
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'ادوات',type: 'tools',index: 2,),));
                          },
                          selected: widget.index == 2,
                        ),
                        NavTabWidget(
                          title: 'تجارب شخصية',
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'تجارب شخصية',type: 'personal',index: 3,),));
                          },
                          selected: widget.index == 3,
                        ),
                        NavTabWidget(
                          title: 'منصات التواصل الاجتماعي',
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'منصات التواصل الاجتماعي',type: 'social',index: 4,),));
                          },
                          selected: widget.index == 4,
                        ),
                        NavTabWidget(
                          title: 'Tips & Tricks',
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'Tips & Tricks',type: 'tips',index: 5,),));
                          },
                          selected: widget.index == 5,
                        ),
                        NavTabWidget(
                          title: 'Case Studies',
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'Case Studies',type: 'case',index: 6,),));
                          },
                          selected: widget.index == 6,
                        ),
                        NavTabWidget(
                          title: 'عن ماركتيكا',
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutMarketika(),));
                          },
                          selected: widget.index == 7,
                        ),
                      ],
                    ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                desktop: false,
              ))
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NavTabWidget(
                            title: 'الرئيسية',
                            onTap: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                            },
                            selected: widget.index == 0,
                          ),
                          NavTabWidget(
                            title: 'يلا نرغي',
                            onTap: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'يلا نرغي',type: 'talk',index: 1,),));
                            },
                            selected: widget.index == 1,
                          ),
                          NavTabWidget(
                            title: 'ادوات',
                            onTap: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'ادوات',type: 'tools',index: 2,),));
                            },
                            selected: widget.index == 2,
                          ),
                          NavTabWidget(
                            title: 'تجارب شخصية',
                            onTap: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'تجارب شخصية',type: 'personal',index: 3,),));
                            },
                            selected: widget.index == 3,
                          ),
                          NavTabWidget(
                            title: 'منصات التواصل الاجتماعي',
                            onTap: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'منصات التواصل الاجتماعي',type: 'social',index: 4,),));
                            },
                            selected: widget.index == 4,
                          ),
                          NavTabWidget(
                            title: 'Tips & Tricks',
                            onTap: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'Tips & Tricks',type: 'tips',index: 5,),));
                            },
                            selected: widget.index == 5,
                          ),
                          NavTabWidget(
                            title: 'Case Studies',
                            onTap: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'Case Studies',type: 'case',index: 6,),));
                            },
                            selected: widget.index == 6,
                          ),
                          NavTabWidget(
                            title: 'عن ماركتيكا',
                            onTap: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutMarketika(),));
                            },
                            selected: widget.index == 7,
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if ((Theme.of(context).brightness == Brightness.light) ==
                          true) {
                        AdaptiveTheme.of(context).setDark();
                        if (animationsMap[
                        'containerOnActionTriggerAnimation'] !=
                            null) {
                          animationsMap['containerOnActionTriggerAnimation']!
                              .controller
                              .forward(from: 0.0);
                        }
                      } else {
                        AdaptiveTheme.of(context).setLight();
                        if (animationsMap[
                        'containerOnActionTriggerAnimation'] !=
                            null) {
                          animationsMap['containerOnActionTriggerAnimation']!
                              .controller
                              .reverse();
                        }
                      }
                    },
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color(0x33000000),
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Stack(
                          alignment: const AlignmentDirectional(0, 0),
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-0.9, 0),
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                                child: Icon(
                                  Icons.sunny,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1, 0),
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                child: Icon(
                                  Icons.nights_stay_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1, 0),
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x430B0D0F),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                  shape: BoxShape.rectangle,
                                ),
                              ).animateOnActionTrigger(
                                animationsMap[
                                'containerOnActionTriggerAnimation']!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
              if (responsiveVisibility(
                context: context,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                  child: AlignedTooltip(
                    content: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                        child: Text(
                          'Tabs',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        )),
                    offset: 4,
                    preferredDirection: AxisDirection.down,
                    borderRadius: BorderRadius.circular(8),
                    backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 3,
                    tailBaseWidth: 16,
                    tailLength: 8,
                    waitDuration: const Duration(milliseconds: 50),
                    showDuration: const Duration(milliseconds: 600),
                    triggerMode: TooltipTriggerMode.tap,
                    child: Builder(
                      builder: (context) => FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderRadius: 12,
                        borderWidth: 1,
                        buttonSize: 44,
                        fillColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          tabsIsOpen? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24,
                        ),
                        onPressed: () async {
                          setState(() {
                            tabsIsOpen = !tabsIsOpen;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                child: badges.Badge(
                  badgeContent: Text(
                    notifications.length.toString(),
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily:
                      FlutterFlowTheme.of(context).titleSmallFamily,
                      color: Colors.white,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context)
                              .titleSmallFamily),
                    ),
                  ),
                  showBadge: false,
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: notifications.isNotEmpty
                        ? Color(0xff9279ba)
                        : FlutterFlowTheme.of(context).alternate,
                    elevation: 4,
                    padding: const EdgeInsets.all(8),
                  ),
                  badgeAnimation: const badges.BadgeAnimation.scale(
                    toAnimate: true,
                  ),
                  position: badges.BadgePosition.topEnd(),

                  child: AlignedTooltip(
                    content: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                        child: Text(
                          'Notifications',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        )),
                    offset: 4,
                    preferredDirection: AxisDirection.down,
                    borderRadius: BorderRadius.circular(8),
                    backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 3,
                    tailBaseWidth: 16,
                    tailLength: 8,
                    waitDuration: const Duration(milliseconds: 50),
                    showDuration: const Duration(milliseconds: 600),
                    triggerMode: TooltipTriggerMode.tap,
                    child: Builder(
                      builder: (context) => FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderRadius: 12,
                        borderWidth: 1,
                        buttonSize: 44,
                        fillColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.notifications_none_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24,
                        ),
                        onPressed: () async {
                          await showAlignedDialog(
                            barrierColor: Colors.transparent,
                            context: context,
                            isGlobal: false,
                            avoidOverflow: true,
                            targetAnchor: const AlignmentDirectional(-1, 1)
                                .resolve(Directionality.of(context)),
                            followerAnchor: const AlignmentDirectional(0, 0)
                                .resolve(Directionality.of(context)),
                            builder: (dialogContext) {
                              return Material(
                                color: Colors.transparent,
                                child: DropdownNotificationsWidget(
                                  notifications: notifications,
                                  loading: loading,
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        ) && tabsIsOpen)
          Padding(
            padding: const EdgeInsets.all(6),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavTabWidget(
                    title: 'الرئيسية',
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                    },
                    selected: widget.index == 0,
                  ),
                  NavTabWidget(
                    title: 'يلا نرغي',
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'يلا نرغي',type: 'talk',index: 1,),));
                    },
                    selected: widget.index == 1,
                  ),
                  NavTabWidget(
                    title: 'ادوات',
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'ادوات',type: 'tools',index: 2,),));
                    },
                    selected: widget.index == 2,
                  ),
                  NavTabWidget(
                    title: 'تجارب شخصية',
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'تجارب شخصية',type: 'personal',index: 3,),));
                    },
                    selected: widget.index == 3,
                  ),
                  NavTabWidget(
                    title: 'منصات التواصل الاجتماعي',
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'منصات التواصل الاجتماعي',type: 'social',index: 4,),));
                    },
                    selected: widget.index == 4,
                  ),
                  NavTabWidget(
                    title: 'Tips & Tricks',
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'Tips & Tricks',type: 'tips',index: 5,),));
                    },
                    selected: widget.index == 5,
                  ),
                  NavTabWidget(
                    title: 'Case Studies',
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'Case Studies',type: 'case',index: 6,),));
                    },
                    selected: widget.index == 6,
                  ),
                  NavTabWidget(
                    title: 'عن ماركتيكا',
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutMarketika(),));
                    },
                    selected: widget.index == 7,
                  ),
                ],
              ),
            ),
          ),
      ],
    ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!);
  }
}


