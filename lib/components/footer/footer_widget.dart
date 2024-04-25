

import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:marketika_website/components/page_name_in_footer/page_name_in_footer_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
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
                    const PageNameInFooterWidget(
                      name: 'يلا نرغي',
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
                    const PageNameInFooterWidget(
                      name: 'عن ماركتيكا',
                    ),
                    const PageNameInFooterWidget(
                      name: 'رحلتي',
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
                    const PageNameInFooterWidget(
                      name: 'ادوات التسويق',
                    ),
                    const PageNameInFooterWidget(
                      name: 'منصات التسوق',
                    ),
                    const PageNameInFooterWidget(
                      name: 'Tips & Tricks',
                    ),
                    const PageNameInFooterWidget(
                      name: 'Case Study',
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
        Row(
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
      ],
    );
  }
}
