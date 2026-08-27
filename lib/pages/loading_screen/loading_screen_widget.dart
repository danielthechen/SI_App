import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'loading_screen_model.dart';
export 'loading_screen_model.dart';

class LoadingScreenWidget extends StatefulWidget {
  const LoadingScreenWidget({super.key});

  static String routeName = 'loading_screen';
  static String routePath = '/loadingScreen';

  @override
  State<LoadingScreenWidget> createState() => _LoadingScreenWidgetState();
}

class _LoadingScreenWidgetState extends State<LoadingScreenWidget>
    with TickerProviderStateMixin {
  late LoadingScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppConstants.appVersion >=
          getRemoteConfigInt('userMinimumAppVersion')) {
        if (functions.checkharrowvian(currentUserEmail)) {
          _model.hMList = await GoogleSheetCall.call(
            spreadsheetId: '1zkOI3HJko6U_rORa1tr5DMARUCKYjmBFu0dSEoM6rS0',
            range: 'D2:D27',
          );

          _model.pEList = await GoogleSheetCall.call(
            spreadsheetId: '1zkOI3HJko6U_rORa1tr5DMARUCKYjmBFu0dSEoM6rS0',
            range: 'J2:J27',
          );

          if ((_model.pEList?.succeeded ?? true) &&
              (_model.hMList?.succeeded ?? true)) {
            if (FFAppState().StaffType.isBoarding) {
              // use not as default value is false
              if (!valueOrDefault<bool>(
                  currentUserDocument?.isOldUser, false)) {
                context.goNamed(OnboardingTeacherWidget.routeName);
              } else {
                context.goNamed(HMHomepageWidget.routeName);
              }
            } else if (functions.crossrefEmails(
                (_model.hMList?.jsonBody ?? ''), currentUserEmail)) {
              // use not as default value is false
              if (valueOrDefault<bool>(currentUserDocument?.isOldUser, false)) {
                context.goNamed(OnboardingTeacherWidget.routeName);
              } else {
                context.goNamed(HMHomepageWidget.routeName);
              }
            } else if (FFAppState().StaffType.isPE) {
              context.goNamed(PEPortalWidget.routeName);
            } else if (functions.crossrefEmails(
                (_model.pEList?.jsonBody ?? ''), currentUserEmail)) {
              FFAppState().updateStaffTypeStruct(
                (e) => e..isPE = true,
              );

              context.goNamed(PEPortalWidget.routeName);
            } else {
              // use not as default boolean value is false
              if (!valueOrDefault<bool>(
                  currentUserDocument?.isOldUser, false)) {
                context.goNamed(
                  OnboardingStudentWidget.routeName,
                  queryParameters: {
                    'studentID': serializeParam(
                      functions.returnStudentIDNumber(currentUserEmail),
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              } else {
                FFAppState().StudentInfo = currentUserDocument!.student;

                context.goNamed(StudentHomepageWidget.routeName);
              }
            }
          } else {
            context.goNamed(
              LoginWidget.routeName,
              extra: <String, dynamic>{
                '__transition_info__': TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Error! Please try again.',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          }
        } else {
          if (FFAppState().StaffType.isAdmin) {
            await currentUserReference!.update(createUsersRecordData(
              student: updateStudentStruct(
                FFAppState().StudentInfo,
                clearUnsetFields: false,
              ),
              teacher: updateStaffStruct(
                FFAppState().StaffType,
                clearUnsetFields: false,
              ),
            ));

            context.goNamed(AdminhomepageWidget.routeName);
          } else {
            // replace the alternative onboarding branch with google sheet api query in case of more exceptions in the future
            if (currentUserEmail == 'XXX') {
              context.goNamed(GuardqrWidget.routeName);
            } else if (currentUserEmail == 'XXX') {
              // use not as default boolean value is false
              if (!valueOrDefault<bool>(
                  currentUserDocument?.isOldUser, false)) {
                context.goNamed(
                  OnboardingStudentWidget.routeName,
                  queryParameters: {
                    'studentID': serializeParam(
                      '0220141131',
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              } else {
                FFAppState().StudentInfo = currentUserDocument!.student;

                context.goNamed(StudentHomepageWidget.routeName);
              }
            } else {
              await authManager.deleteUser(context);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Email not recognised!',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                ),
              );

              context.goNamed(
                LoginWidget.routeName,
                extra: <String, dynamic>{
                  '__transition_info__': TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            }
          }
        }
      } else {
        context.goNamed(
          PageupdateWidget.routeName,
          extra: <String, dynamic>{
            '__transition_info__': TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );

        return;
      }
    });

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1020.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1500.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: Color(0xFF263B53),
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: true,
          toolbarHeight: 0.0,
          elevation: 3.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height < 801.0
                            ? 700.0
                            : 730.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -3.27),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 32.0, 32.0, 32.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 75.0, 0.0, 20.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Image.asset(
                                    'assets/images/SI_Logo_Transparent_2024-08.png',
                                    width: MediaQuery.sizeOf(context).width *
                                        0.578,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.273,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ).animateOnPageLoad(
                                    animationsMap['imageOnPageLoadAnimation']!),
                              ),
                              GradientText(
                                'Loading...',
                                style: FlutterFlowTheme.of(context)
                                    .displayLarge
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .displayLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFC9D2DC),
                                      fontSize:
                                          MediaQuery.sizeOf(context).width >=
                                                  810.0
                                              ? 90.0
                                              : 50.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .fontStyle,
                                      lineHeight: 1.1,
                                    ),
                                colors: [
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  FlutterFlowTheme.of(context).primaryBackground
                                ],
                                gradientDirection: GradientDirection.ltr,
                                gradientType: GradientType.linear,
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation1']!),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: Text(
                                  'Please contact:\nsolutions.incubator.hishk@gmail.com\nif you are stuck on this screen.',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.raleway(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFD1D8E3),
                                        fontSize:
                                            MediaQuery.sizeOf(context).width >=
                                                    810.0
                                                ? 32.0
                                                : 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                        lineHeight: 1.14,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation2']!),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['stackOnPageLoadAnimation']!),
                ],
              ),
              Opacity(
                opacity: 0.9,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                      color: Color(0xFF263B53),
                    ),
                    child: Opacity(
                      opacity: 0.7,
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Solutions Incubator @ HarrowHK ',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  font: GoogleFonts.raleway(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).alternate,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .fontStyle,
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation3']!),
                        ),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
