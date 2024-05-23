import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:marketika_website/components/footer/footer_widget.dart';
import 'package:marketika_website/components/top_nav/top_nav_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

import 'about_marketika_model.dart';
export 'about_marketika_model.dart';

class AboutMarketika extends StatefulWidget {
  const AboutMarketika({super.key});

  @override
  State<AboutMarketika> createState() => _AboutMarketikaState();
}

class _AboutMarketikaState extends State<AboutMarketika> {
  late AboutMarketikaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutMarketikaModel());
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
                child: const TopNavWidget(index: 7,),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'عن ماركتيكا ..',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                    fontFamily:
                                    FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primary,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                        FlutterFlowTheme.of(context)
                                            .titleMediumFamily),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      208, 8, 20, 20),
                                  child: Text(
                                    'ماركتيكا هي المكان اللي هدفها مساعدة اصحاب الاعمال او الماركتيرز اللي بيشتغلوا في مجال التسويق الرقمي وبالأخص السوشيال ميديا. ماركتيكا بتقدم منصة كاملة تعليمية عشان تتعلم فيها كل حاجة من الألف إلى الياء، من أول انشاء صفحات على السوشيال ميديا بطريقة سليمة وإدارتها بشكل احترافي، وكتابة المحتوى، وعمل خطة كاملة للبيزنس، وبعض الأدوات والنصائح اللي هتخلي شغلك في حته تاني …',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 18,

                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .titleMediumFamily),
                                    ),
                                    textDirection: ui.TextDirection.rtl,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      208, 8, 20, 20),
                                  child: Text(
                                    'الويب سايت ده هو المكان اللي هيساعدك تتعلم وتقرأ وتتسلى في كل ما يخص الماركتينج أو التسويق بالعربي وبأسلوب سهل وبسيط، وهيكون مرجع ليك في أي وقت لو فعلاً ناوي تدوس في مجال التسويق Marketing وخصوصاً مجال السوشيال ميديا Social Media. الويب سايت هيضم اقسام كتيرة منها: قسم للأدوات اللي هتساعدك في شغلك - قسم خاص بكل منصة Social Media Platform واللي هتعرف من خلالها كل حاجة عن المنصة دي - قسم هيديك كل التركات اللي تخلى بالك منها وتبقى ناجح في المجال ده Social Media Tips & Tricks - قسم هنعرض فيه قصص حقيقة والدروس المستفادة منها - ده غير اننا هنعمل ملفات تقدر تحملها Templates هتساعدك جداً في شغلك وتختصر وقت كبير. كل الأقسام دي ومش هننسى اننا محتاجين كمان ندردش سوا عشان لو حد حابب يشارك حاجة او يسأل واحنا هنجاوبه.',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 18,

                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .titleMediumFamily),
                                    ),
                                    textDirection: ui.TextDirection.rtl,
                                  ),
                                ),
                              ],
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
