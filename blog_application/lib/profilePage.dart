// import '../auth/auth_util.dart';
// import '../backend/backend.dart';
// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
// import '../flutter_flow/flutter_flow_widgets.dart';
// import '../login_page/login_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:blog_application/login.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePageWidget extends StatefulWidget {
  // const ProfilePageWidget({required Key key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late TextEditingController emailAddressController;
  late TextEditingController textController1;
  late TextEditingController myBioController;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  get currentUserReference => null;

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController(text: "user@gmail.com");
    textController1 = TextEditingController(text: '[display_name]');
    myBioController = TextEditingController(text: '[bio]');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                // color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        final profilePageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 24,
              ),
            ),
            title: Text(
              'My Profile',
              // style: FlutterFlowTheme.bodyText1.override(
              //   fontFamily: 'Lexend Deca',
              //   color: Color(0xFF14181B),
              //   fontSize: 14,
              //   fontWeight: FontWeight.w500,
              // ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFDBE2E7),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: Container(
                          width: 90,
                          height: 90,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            '../assets/images/user.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                  child: TextFormField(
                    controller: textController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      // labelStyle: FlutterFlowTheme.bodyText1.override(
                      //   fontFamily: 'Lexend Deca',
                      //   color: Color(0xFF95A1AC),
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.normal,
                      // ),
                      hintText: 'Your full name...',
                      // hintStyle: FlutterFlowTheme.bodyText1.override(
                      //   fontFamily: 'Lexend Deca',
                      //   color: Color(0xFF95A1AC),
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.normal,
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                    ),
                    // style: FlutterFlowTheme.bodyText1.override(
                    //   fontFamily: 'Lexend Deca',
                    //   color: Color(0xFF14181B),
                    //   fontSize: 14,
                    //   fontWeight: FontWeight.normal,
                    // ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                  child: Container(
                    child: TextFormField(
                      controller: emailAddressController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        // labelStyle: FlutterFlowTheme.bodyText1.override(
                        //   fontFamily: 'Lexend Deca',
                        //   color: Color(0xFF95A1AC),
                        //   fontSize: 14,
                        //   fontWeight: FontWeight.normal,
                        // ),
                        hintText: 'Your email..',
                        // hintStyle: FlutterFlowTheme.bodyText1.override(
                        //   fontFamily: 'Lexend Deca',
                        //   color: Color(0xFF95A1AC),
                        //   fontSize: 14,
                        //   fontWeight: FontWeight.normal,
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      // style: FlutterFlowTheme.bodyText1.override(
                      //   fontFamily: 'Lexend Deca',
                      //   color: Color(0xFF14181B),
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.normal,
                      // ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                  child: TextFormField(
                    controller: myBioController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Bio',
                      // labelStyle: FlutterFlowTheme.bodyText1.override(
                      //   fontFamily: 'Lexend Deca',
                      //   color: Color(0xFF95A1AC),
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.normal,
                      // ),
                      hintText: 'A little about you...',
                      // hintStyle: FlutterFlowTheme.bodyText1.override(
                      //   fontFamily: 'Lexend Deca',
                      //   color: Color(0xFF95A1AC),
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.normal,
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                    ),
                    // style: FlutterFlowTheme.bodyText1.override(
                    //   fontFamily: 'Lexend Deca',
                    //   color: Color(0xFF14181B),
                    //   fontSize: 14,
                    //   fontWeight: FontWeight.normal,
                    // ),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0.05),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: ElevatedButton(
                      child: Text('Logout'),
                      onPressed: () async {
                        setState(() => _loadingButton = true);
                        try {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPageWidget(),
                            ),
                          );
                        } finally {
                          setState(() => _loadingButton = false);
                        }
                      },
                      // text: 'Logout',
                      // options: FFButtonOptions(
                      //   width: 340,
                      //   height: 60,
                      //   color: Color(0xFFCD5E77),
                      //   textStyle: FlutterFlowTheme.subtitle2.override(
                      //     fontFamily: 'Lexend Deca',
                      //     color: Colors.white,
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.normal,
                      //   ),
                      //   elevation: 2,
                      //   borderSide: BorderSide(
                      //     color: Colors.transparent,
                      //     width: 1,
                      //   ),
                      //   borderRadius: 8,
                      // ),
                      // loading: _loadingButton,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class UsersRecord {
  static getDocument(currentUserReference) {}
}
