import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blog_application/blogDashboard.dart';
import 'package:google_sign_in/google_sign_in.dart' as gs;
import 'package:google_sign_in/google_sign_in.dart';


import 'auth.dart';
import 'createAccount.dart';
import 'main.dart';

class LoginPageWidget extends StatefulWidget {

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  // creating firebase instance
  final FirebaseAuth auth = FirebaseAuth.instance;
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  late bool passwordVisibility;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var authHandler = new Auth();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0, -1),
            child: Image.asset(
              'assets/images/loginBackground.png',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 200, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: Image.asset(
                                'assets/images/icon.png',
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6, 0, 4, 15),
                                  child: Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE0E0E0),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 20, 0),
                                      child: TextFormField(
                                        controller: emailTextController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Email',
                                          hintStyle: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Color(0x7F455A64),
                                            fontWeight: FontWeight.normal,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: Color(0xFF455A64),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 4, 20),
                                  child: Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE0E0E0),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 20, 0),
                                      child: TextFormField(
                                        controller: passwordTextController,
                                        obscureText: !passwordVisibility,
                                        decoration: InputDecoration(
                                          hintText: 'Password',
                                          hintStyle: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Color(0x7F455A64),
                                            fontWeight: FontWeight.normal,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => passwordVisibility =
                                                  !passwordVisibility,
                                            ),
                                            child: Icon(
                                              passwordVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: Color(0xFF455A64),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 18),
                                  child: InkWell(
                                    onLongPress: () async {
                                      setState(() => _loadingButton1 = true);
                                      try {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BlogDashboardWidget(),
                                            // HomePage(),
                                          ),
                                        );
                                      } finally {
                                        setState(() => _loadingButton1 = false);
                                      }
                                    },
                                    child: RaisedButton(
                                      child: Text('Sign in with email'),
                                      textColor: Colors.white,
                                      color: Colors.purple,
                                        onPressed: () {
                                          authHandler.handleSignInEmail(
                                              emailTextController.text,
                                              passwordTextController.text)
                                              .then((User user) {
                                            Navigator.push(context,
                                                new MaterialPageRoute(builder: (
                                                    context) => new BlogDashboardWidget()));
                                            showFlushbar(context);
                                          }).catchError((e) => printError(e, context));
                                        }
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 15),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CreateAccountPageWidget(),
                                        ),
                                        (r) => false,
                                      );
                                    },
                                    child: Text(
                                      'Create Account',
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                child: Container(
                                  width: 250,
                                  height: 50,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: ElevatedButton(
                                          child: Text('Login with Google'),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.purple,
                                            // background
                                            onPrimary: Colors.white,
                                          ), // background
                                          onPressed: (){
                                              signInWithGoogle(context);
                                          },
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.83, 0),
                                        child: Container(
                                          width: 22,
                                          height: 22,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }


  // function to implement the google signin
  Future<void> signInWithGoogle(BuildContext context) async {

    final gs.GoogleSignIn googleSignIn = new gs.GoogleSignIn(clientId: "609421566052-483o7psiht39jlbdapbok51s940p589m.apps.googleusercontent.com");
    final gs.GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    // print(FirebaseAuth.instance.currentUser!.uid);
    if (googleSignInAccount != null) {
      // print(FirebaseAuth.instance.currentUser!.uid);
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BlogDashboardWidget()));
      }
    }
  }

  void printError(e, BuildContext context) {
    print(e.toString());
    final snackBar = SnackBar(content: Text('Unsuccessful login! Please try again'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showFlushbar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Successful login! Welcome back!'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
