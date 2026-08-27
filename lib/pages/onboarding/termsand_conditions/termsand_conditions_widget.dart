import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'termsand_conditions_model.dart';
export 'termsand_conditions_model.dart';

class TermsandConditionsWidget extends StatefulWidget {
  const TermsandConditionsWidget({super.key});

  static String routeName = 'TermsandConditions';
  static String routePath = '/termsandConditions';

  @override
  State<TermsandConditionsWidget> createState() =>
      _TermsandConditionsWidgetState();
}

class _TermsandConditionsWidgetState extends State<TermsandConditionsWidget> {
  late TermsandConditionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsandConditionsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text(
            'Terms and Conditions',
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tap the lock button on the upper right of the homescreen if you wish to return to this page.\n\nTerms and Conditions for Solutions Incubator\n\nEffective Date: 26/3/25\n\nWelcome to Solutions Incubator! By accessing or using our application, you agree to comply with and be bound by the following Terms and Conditions. Please read these terms carefully before using the app.\n\n1. Acceptance of Terms\nBy using the Solutions Incubator app, you agree to these Terms and Conditions and our Privacy Policy. If you do not agree, please do not use the app.\n\n2. Eligibility\nTo use the Solutions Incubator app, you must be a registered student at Harrow International School HK. By accepting these terms, you confirm that you meet this eligibility requirement.\n\n3. Account Registration\nYou may be required to create an account to access certain features of the app. You agree to:\n\nProvide accurate, current, and complete information during the registration process.\nMaintain the security of your password and account information.\nNotify us immediately of any unauthorized use of your account.\nBe responsible for all activities that occur under your account.\n\n4. Use of the App\nYou agree to use the Solutions Incubator app only for lawful purposes and in accordance with these Terms. You agree not to:\n\nUse the app in any manner that violates any applicable federal, state, local, or international law or regulation.\nTransmit or procure the sending of any advertising or promotional material without our prior written consent.\nEngage in any conduct that restricts or inhibits anyone\'s use or enjoyment of the app, or which may harm us or users of the app.\n\n5. Termination\nWe reserve the right to terminate or suspend your account and access to the app at our sole discretion, without notice, for conduct that we believe violates these Terms or is harmful to other users or us.\n\n6. Disclaimer of Warranties\nThe Solutions Incubator app is provided on an \"as is\" and \"as available\" basis. We do not warrant that the app will be uninterrupted or error-free or that any defects will be corrected. We disclaim all warranties, express or implied, including but not limited to implied warranties of merchantability and fitness for a particular purpose.\n\n7. Limitation of Liability\nTo the fullest extent permitted by law, in no event shall Solutions Incubator, its affiliates, or their respective directors, employees, or agents be liable for any indirect, incidental, special, consequential, or punitive damages arising out of or related to your use of the app.\n\n8. Changes to These Terms\nWe reserve the right to modify these Terms at any time. Any changes will be effective immediately upon posting. Your continued use of the app after changes are made will constitute your acceptance of the revised Terms.\n\n9. Governing Law\nThese Terms shall be governed by and construed in accordance with the laws of Hong Kong, without regard to its conflict of law principles.\n\n10. Contact Information\nIf you have any questions about these Terms, please contact us at : solutions.incubator.hishk@gmail.com',
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
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          accessAuth: createAccessAuthenticatorsStruct(
                            signedAppToCs: true,
                            clearUnsetFields: false,
                          ),
                        ));
                        FFAppState().updateAccessAuthStruct(
                          (e) => e..signedAppToCs = true,
                        );

                        context.goNamed(StudentHomepageWidget.routeName);
                      },
                      text: 'Agree to all terms and conditions',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.raleway(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 50.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
