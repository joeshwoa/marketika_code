import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:marketika_website/components/page_name_in_footer/page_name_in_footer_widget.dart';
import 'package:marketika_website/pages/blogs_page/blogs_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  
  bool isHover = false;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
              SizedBox(
                width: MediaQuery.of(context).size.width*0.2,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'للتواصل',
                      style: FlutterFlowTheme.of(context)
                          .bodyLarge,
                    ),
                    PageNameInFooterWidget(
                      name: 'يلا نرغي',
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'يلا نرغي',type: 'talk',index: 2,),));
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'من نحن',
                      style: FlutterFlowTheme.of(context)
                          .bodyLarge,
                    ),
                    PageNameInFooterWidget(
                      name: 'عن ماركتيكا',
                      onTap: () async {
                        /*Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'يلا نرغي',type: 'ra8y',index: 2,),));*/
                      },
                    ),
                    PageNameInFooterWidget(
                      name: 'رحلتي',
                      onTap: () async {
                        /*Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'يلا نرغي',type: 'ra8y',index: 2,),));*/
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'مقالات',
                      style: FlutterFlowTheme.of(context)
                          .bodyLarge,
                    ),
                    PageNameInFooterWidget(
                      name: 'ادوات التسويق',
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'ادوات',type: 'tools',index: 3,),));
                      },
                    ),
                    PageNameInFooterWidget(
                      name: 'منصات التسوق',
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'منصات التواصل الاجتماعي',type: 'social',index: 2,),));
                      },
                    ),
                    PageNameInFooterWidget(
                      name: 'Tips & Tricks',
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'Tips & Tricks',type: 'tips',index: 1,),));
                      },
                    ),
                    PageNameInFooterWidget(
                      name: 'Case Study',
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogsPage(name: 'Case Studies',type: 'case',index: 5,),));
                      },
                    ),
                  ],
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.2,
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (await canLaunchUrl(Uri.parse(''))) {
                    await launchUrl(Uri.parse(''));
                  } else {
                    throw 'Could not launch Facebook';
                  }
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context)
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
                padding:
                const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (await canLaunchUrl(Uri.parse(''))) {
                      await launchUrl(Uri.parse(''));
                    } else {
                      throw 'Could not launch Instagram';
                    }
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context)
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
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (await canLaunchUrl(Uri.parse(''))) {
                    await launchUrl(Uri.parse(''));
                  } else {
                    throw 'Could not launch TikTok';
                  }
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context)
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                child: Text(
                  'Powered by',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0,
                    useGoogleFonts: GoogleFonts.asMap()
                        .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
                ),
              ),
              InkWell(
                onHover: (bool hovering) {
                  setState(() {
                    isHover = hovering;
                  });  
                },
                onTap: () {
                  launchUrl(Uri.parse('https://cominde.onrender.com'));
                },
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'assets/images/ei_1693592425619-removebg-preview.png',
                    width: isHover?60:40,
                    height: isHover?60:40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
