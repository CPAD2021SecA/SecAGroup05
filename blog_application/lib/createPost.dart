
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blog_application/blogDashboard.dart';
import 'package:blog_application/profilePage.dart';

class CreatePostWidget extends StatefulWidget {
  // const CreatePostWidget({Key key}) : super(key: key);

  @override
  _CreatePostWidgetState createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  late String dropDownValue;
  String uploadedFileUrl = '';
  late TextEditingController textController1;
  late TextEditingController textController2;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Create Post',
          // style: FlutterFlowTheme.title2.override(
          //   fontFamily: 'Lexend Deca',
          //   color: Color(0xFF090F13),
          //   fontSize: 22,
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: IconButton(
              // borderColor: Colors.transparent,
              // borderRadius: 30,
              // buttonSize: 48,
              icon: Icon(
                Icons.close_rounded,
                color: Color(0xFF95A1AC),
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          )
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                validateFileFormat(
                                    selectedMedia.storagePath, context)) {
                              showUploadMessage(context, 'Uploading file...');
                              final downloadUrl = await uploadData(
                                  selectedMedia.storagePath,
                                  selectedMedia.bytes);
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              if (downloadUrl != null) {
                                setState(() => uploadedFileUrl = downloadUrl);
                                showUploadMessage(context, 'Success!');
                              } else {
                                showUploadMessage(
                                    context, 'Failed to upload media');
                                return;
                              }
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.96,
                            height: 350,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F5F8),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/emptyState@2x.png',
                                ).image,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  color: Color(0x3A000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Title...',
                                  // hintStyle:
                                  // FlutterFlowTheme.bodyText2.override(
                                  //   fontFamily: 'Lexend Deca',
                                  //   color: Color(0xFF8B97A2),
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
                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      20, 32, 20, 12),
                                ),
                                // style: FlutterFlowTheme.bodyText1.override(
                                //   fontFamily: 'Lexend Deca',
                                //   color: Color(0xFF090F13),
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.normal,
                                // ),
                                textAlign: TextAlign.start,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textController2,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Description...',
                                  // hintStyle:
                                  // FlutterFlowTheme.bodyText2.override(
                                  //   fontFamily: 'Lexend Deca',
                                  //   color: Color(0xFF8B97A2),
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
                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      20, 32, 20, 12),
                                ),
                                // style: FlutterFlowTheme.bodyText1.override(
                                //   fontFamily: 'Lexend Deca',
                                //   color: Color(0xFF090F13),
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.normal,
                                // ),
                                textAlign: TextAlign.start,
                                maxLines: 4,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              // child: DropDown(
                              //   options: ['Category1', 'Category2'].toList(),
                              //   onChanged: (val) =>
                              //       setState(() => dropDownValue = val),
                              //   width: MediaQuery.of(context).size.width * 0.94,
                              //   textStyle: FlutterFlowTheme.bodyText1.override(
                              //     fontFamily: 'Playfair Display',
                              //     color: Colors.black,
                              //   ),
                              //   fillColor: Colors.white,
                              //   elevation: 2,
                              //   borderColor: FlutterFlowTheme.tertiaryColor,
                              //   borderWidth: 0,
                              //   borderRadius: 0,
                              //   margin: EdgeInsetsDirectional.fromSTEB(
                              //       12, 4, 12, 0),
                              //   hidesUnderline: true,
                              // ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: ElevatedButton(
            child: Text('Create Post'),
              onPressed: () async {
                setState(() => _loadingButton = true);
                try {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlogDashboardWidget(),
                    ),
                  );
                } finally {
                  setState(() => _loadingButton = false);
                }
              },
              // text: 'Create Post',
              // options: FFButtonOptions(
              //   width: 270,
              //   height: 60,
              //   color: Color(0xFFCD5E77),
              //   textStyle: FlutterFlowTheme.subtitle2.override(
              //     fontFamily: 'Lexend Deca',
              //     color: Colors.white,
              //     fontSize: 16,
              //     fontWeight: FontWeight.w500,
              //   ),
              //   elevation: 3,
              //   borderSide: BorderSide(
              //     color: Colors.transparent,
              //     width: 1,
              //   ),
              //   borderRadius: 8,
              // ),
              // loading: _loadingButton,
            ),
          )
        ],
      ),
    );
  }

  selectMediaWithSourceBottomSheet({required BuildContext context, required bool allowPhoto}) {}

  bool validateFileFormat(storagePath, BuildContext context) { return true;}

  void showUploadMessage(BuildContext context, String s) {}

  uploadData(storagePath, bytes) {}
}
