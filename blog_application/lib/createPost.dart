// import 'package:blog_application/home.dart';
// import 'package:blog_application/providers/blog_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:blog_application/screens/blogDashboard.dart';
// import 'package:blog_application/profilePage.dart';
// import 'package:provider/provider.dart';
//
// class CreatePostWidget extends StatefulWidget {
//   // const CreatePostWidget({Key key}) : super(key: key);
//
//   @override
//   _CreatePostWidgetState createState() => _CreatePostWidgetState();
// }
//
// class _CreatePostWidgetState extends State<CreatePostWidget> {
//   String dropDownValue = "Health";
//   String uploadedFileUrl = '';
//   late TextEditingController textController1;
//   late TextEditingController textController2;
//   bool _loadingButton = false;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     textController1 = TextEditingController();
//     textController2 = TextEditingController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final blogProvider = Provider.of<BlogProvider>(context);
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         title: Text(
//           'Create Post',
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
//             child: IconButton(
//               // borderColor: Colors.transparent,
//               // borderRadius: 30,
//               // buttonSize: 48,
//               icon: Icon(
//                 Icons.close_rounded,
//                 color: Color(0xFF95A1AC),
//                 size: 30,
//               ),
//               onPressed: () async {
//                 Navigator.pop(context);
//               },
//             ),
//           )
//         ],
//         centerTitle: false,
//         elevation: 0,
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.94,
//                     decoration: BoxDecoration(),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
//                           child: InkWell(
//                             onTap: () async {
//                               final selectedMedia =
//                                   await selectMediaWithSourceBottomSheet(
//                                 context: context,
//                                 allowPhoto: true,
//                               );
//                               if (selectedMedia != null &&
//                                   validateFileFormat(
//                                       selectedMedia.storagePath, context)) {
//                                 showUploadMessage(context, 'Uploading file...');
//                                 final downloadUrl = await uploadData(
//                                     selectedMedia.storagePath,
//                                     selectedMedia.bytes);
//                                 ScaffoldMessenger.of(context)
//                                     .hideCurrentSnackBar();
//                                 if (downloadUrl != null) {
//                                   setState(() => uploadedFileUrl = downloadUrl);
//                                   showUploadMessage(context, 'Success!');
//                                 } else {
//                                   showUploadMessage(
//                                       context, 'Failed to upload media');
//                                   return;
//                                 }
//                               }
//                             },
//                             child: Container(
//                               width: MediaQuery.of(context).size.width * 0.96,
//                               height: 350,
//                               decoration: BoxDecoration(
//                                 color: Color(0xFFF1F5F8),
//                                 image: DecorationImage(
//                                   fit: BoxFit.contain,
//                                   image: Image.asset(
//                                     'assets/images/addImage.jpg',
//                                   ).image,
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     blurRadius: 6,
//                                     color: Color(0x3A000000),
//                                     offset: Offset(0, 2),
//                                   )
//                                 ],
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Expanded(
//                                 child: TextFormField(
//                                   controller: textController1,
//                                   obscureText: false,
//                                   decoration: InputDecoration(
//                                     hintText: 'Title...',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0xFFDBE2E7),
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0xFFDBE2E7),
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     contentPadding:
//                                         EdgeInsetsDirectional.fromSTEB(
//                                             20, 32, 20, 12),
//                                   ),
//                                   onChanged: (value) {
//                                     blogProvider.changeTitle(value);
//                                   },
//                                   textAlign: TextAlign.start,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Expanded(
//                                 child: TextFormField(
//                                   controller: textController2,
//                                   obscureText: false,
//                                   decoration: InputDecoration(
//                                     hintText: 'Description...',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0xFFDBE2E7),
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0xFFDBE2E7),
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     contentPadding:
//                                         EdgeInsetsDirectional.fromSTEB(
//                                             20, 32, 20, 12),
//                                   ),
//                                   onChanged: (value){
//                                     blogProvider.changeDescription(value);
//                                   },
//                                   textAlign: TextAlign.start,
//                                   maxLines: 4,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Expanded(
//                                 child: TextFormField(
//                                   controller: textController2,
//                                   obscureText: false,
//                                   decoration: InputDecoration(
//                                     hintText: 'Category...',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0xFFDBE2E7),
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0xFFDBE2E7),
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     contentPadding:
//                                     EdgeInsetsDirectional.fromSTEB(
//                                         20, 32, 20, 12),
//                                   ),
//                                   onChanged: (value){
//                                     blogProvider.changeCategory(value);
//                                   },
//                                   textAlign: TextAlign.start,
//                                   maxLines: 4,
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.purple, // background
//                   onPrimary: Colors.white, // foreground
//                 ),
//                 child: Text('Create Post'),
//                 onPressed: (){
//                   blogProvider.saveBlog();
//                   Navigator.of(context).pop();
//                 },
//                 // text: 'Create Post',
//                 // options: FFButtonOptions(
//                 //   width: 270,
//                 //   height: 60,
//                 //   color: Color(0xFFCD5E77),
//                 //   textStyle: FlutterFlowTheme.subtitle2.override(
//                 //     fontFamily: 'Lexend Deca',
//                 //     color: Colors.white,
//                 //     fontSize: 16,
//                 //     fontWeight: FontWeight.w500,
//                 //   ),
//                 //   elevation: 3,
//                 //   borderSide: BorderSide(
//                 //     color: Colors.transparent,
//                 //     width: 1,
//                 //   ),
//                 //   borderRadius: 8,
//                 // ),
//                 // loading: _loadingButton,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   selectMediaWithSourceBottomSheet(
//       {required BuildContext context, required bool allowPhoto}) {}
//
//   bool validateFileFormat(storagePath, BuildContext context) {
//     return true;
//   }
//
//   void showUploadMessage(BuildContext context, String s) {}
//
//   uploadData(storagePath, bytes) {}
// }

