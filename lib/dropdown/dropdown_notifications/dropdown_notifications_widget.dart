import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:marketika_website/components/empty_state/empty_state_widget.dart';

import 'dropdown_notifications_model.dart';
export 'dropdown_notifications_model.dart';

class DropdownNotificationsWidget extends StatefulWidget {
  const DropdownNotificationsWidget({super.key,required this.notifications, required this.loading});
  final List<Map<String, String>> notifications;
  final bool loading;

  @override
  State<DropdownNotificationsWidget> createState() =>
      _DropdownNotificationsWidgetState();
}

class _DropdownNotificationsWidgetState
    extends State<DropdownNotificationsWidget> with TickerProviderStateMixin {
  late DropdownNotificationsModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0, 10),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.873, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };



  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownNotificationsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*context.watch<FFAppState>();*/

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 90, 16, 16),
      child: Container(
        width: 430,
        height: 400,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Text(
                        'Notifications',
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderRadius: 12,
                      borderWidth: 1,
                      buttonSize: 44,
                      icon: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: widget.loading?Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  ):widget.notifications.isEmpty?EmptyStateWidget(
                    title: 'No notifications',
                    bodyText: 'Seems you are all up to date!',
                    icon: Icon(
                            Icons.notifications_active_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 90,
                          ),
                  ):ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: widget.notifications.length,
                    itemBuilder: (context, listViewIndex) {
                      final notification = widget.notifications[listViewIndex];
                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          /*onTap: () async {
                                await listViewActivityRecord.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'unreadByUser': FieldValue.arrayRemove(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              },*/
                          child: Container(
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0,
                                  color: FlutterFlowTheme.of(context)
                                      .alternate,
                                  offset: const Offset(0, 1),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 8, 16, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).accent1,
                                      borderRadius:
                                      BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context).primary,
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(6),
                                        child: Image.asset(
                                          'assets/images/important.png',
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            notification['title']!,
                                            style:
                                            FlutterFlowTheme.of(context)
                                                .bodyLarge,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                notification['body']!,
                                                style: FlutterFlowTheme.of(
                                                    context)
                                                    .labelSmall,
                                              ),
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
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
