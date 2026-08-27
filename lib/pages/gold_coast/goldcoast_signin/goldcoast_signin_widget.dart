import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/q_rworked_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'goldcoast_signin_model.dart';
export 'goldcoast_signin_model.dart';

/// scannerpage
class GoldcoastSigninWidget extends StatefulWidget {
  const GoldcoastSigninWidget({super.key});

  static String routeName = 'goldcoast_signin';
  static String routePath = '/GCscanner';

  @override
  State<GoldcoastSigninWidget> createState() => _GoldcoastSigninWidgetState();
}

class _GoldcoastSigninWidgetState extends State<GoldcoastSigninWidget> {
  late GoldcoastSigninModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoldcoastSigninModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Scan Into School',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.raleway(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(40.0, 50.0, 40.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.qrTime = await FlutterBarcodeScanner.scanBarcode(
                          '#C62828', // scanning line color
                          'Cancel', // cancel button text
                          true, // whether to show the torch (camera LED) toggle icon
                          ScanMode.QR,
                        );

                        _model.currentTimeNum =
                            getCurrentTimestamp.secondsSinceEpoch;
                        _model.qrTimeNum = int.parse((_model.qrTime));
                        if ((_model.currentTimeNum! <=
                                ((_model.qrTimeNum!) + 120)) &&
                            (_model.currentTimeNum! >=
                                ((_model.qrTimeNum!) - 120))) {
                          _model.todayDoc = await queryGoldcoastRecordOnce(
                            queryBuilder: (goldcoastRecord) => goldcoastRecord
                                .where(
                                  'student.StudentID',
                                  isEqualTo: FFAppState().StudentInfo.studentID,
                                )
                                .where(
                                  'date',
                                  isEqualTo: functions.returnTodayDate(),
                                ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);

                          await _model.todayDoc!.reference
                              .update(createGoldcoastRecordData(
                            reenterTime: getCurrentTimestamp,
                          ));
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: QRworkedWidget(
                                    name: FFAppState().StudentInfo.name,
                                    inout: 'in',
                                    image: FFAppState().Selfie,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));

                          _model.hMs = await queryUsersRecordOnce(
                            queryBuilder: (usersRecord) => usersRecord
                                .where(
                                  'teacher.House',
                                  isEqualTo: FFAppState().StudentInfo.house,
                                )
                                .where(
                                  'teacher.isBoarding',
                                  isEqualTo: true,
                                ),
                          );
                          triggerPushNotification(
                            notificationTitle: 'Gold Coast',
                            notificationText:
                                '${FFAppState().StudentInfo.name} has returned from Gold Coast!',
                            notificationImageUrl: FFAppState().Selfie,
                            notificationSound: 'default',
                            userRefs:
                                _model.hMs!.map((e) => e.reference).toList(),
                            initialPageName: 'Allstudentpage',
                            parameterData: {},
                          );

                          context.goNamed(
                            StudentHomepageWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        } else {
                          if (_model.qrTime != '') {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'QR invalid or expired! Please try again or use the next one.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          }
                        }

                        safeSetState(() {});
                      },
                      text: 'Re-Enter',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 150.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Scan the QR Code at the Guard\'s Gate',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.raleway(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 200.0),
                child: Container(
                  width: 300.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                    child: Text(
                      'The time is currently ${dateTimeFormat(
                        "Hm",
                        getCurrentTimestamp,
                        locale: FFLocalizations.of(context).languageCode,
                      )}                                            Please return to school by 18:15 or else you will be marked late.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.raleway(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 5.0)),
          ),
        ),
      ),
    );
  }
}
