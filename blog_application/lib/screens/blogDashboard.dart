
import 'package:blog_application/addPost.dart';
import 'package:blog_application/models/blog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blog_application/profilePage.dart';
import 'package:provider/provider.dart';
import '../auth.dart';

class BlogDashboardWidget extends StatefulWidget {

  @override
  _BlogDashboardWidgetState createState() => _BlogDashboardWidgetState();
}

class _BlogDashboardWidgetState extends State<BlogDashboardWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var authHandler = new Auth();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   key: scaffoldKey,
    //   backgroundColor: Colors.white,
    //   body: Column(
    //     mainAxisSize: MainAxisSize.max,
    //     children: [
    //       Container(
    //         width: MediaQuery.of(context).size.width,
    //         height: 100,
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //         ),
    //
    //       ),
    //       Expanded(
    //         child: DefaultTabController(
    //           length: 2,
    //           initialIndex: 0,
    //           child: Column(
    //             children: [
    //               TabBar(
    //                 isScrollable: true,
    //                 labelColor: Color(0xFF8E24AA),
    //                 unselectedLabelColor: Color(0xFF95A1AC),
    //                 labelStyle: GoogleFonts.getFont(
    //                   'Roboto',
    //                 ),
    //                 indicatorColor: Color(0xFF8E24AA),
    //                 indicatorWeight: 3,
    //                 tabs: [
    //                   Tab(
    //                     text: 'My Feed',
    //                   ),
    //                   Tab(
    //                     text: 'Categories',
    //                   )
    //                 ],
    //               ),
    //               Expanded(
    //                 child: TabBarView(
    //                   children: [
    //                     StreamBuilder<QuerySnapshot>(
    //                       stream: FirebaseFirestore.instance.collection('blogs').snapshots(),
    //                       builder: (context, snapshot){
    //                         return ListView.builder(
    //                           itemCount: snapshot.data!.docs.length,
    //                           itemBuilder: (context, index){
    //                             DocumentSnapshot docblog = snapshot.data!.docs[index];
    //                             return Card(
    //                                 child: ListTile(
    //                                     title: Text(docblog['title'],style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    //                                     trailing: Text(docblog['category']),
    //                                     subtitle: Text(docblog['description'])
    //                                 ));
    //                           },
    //                         );
    //                       },
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //
    //
    //     ],
    //   ),
    //   bottomNavigationBar: BottomAppBar(
    //     child: Container(
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(colors: [Color(0xFFBA68C8), Color(0xFF8E24AA)]),
    //       ),
    //       child: Padding(
    //         padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             IconButton(
    //                 tooltip: 'Home',
    //                 icon: Icon(Icons.home),
    //                 onPressed: () {
    //                   Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                         builder: (context) => BlogDashboardWidget(),
    //                       ));
    //                 }),
    //             IconButton(
    //                 tooltip: 'Add post',
    //                 icon: Icon(Icons.add_circle),
    //                 onPressed: () {
    //                   Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                         builder: (context) => AddPostWidget(),
    //                         //CreatePostWidget(),
    //                       ));
    //                 }),
    //             IconButton(
    //                 tooltip: 'Profile',
    //                 icon: Icon(Icons.person),
    //                 onPressed: () {
    //                   Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                         builder: (context) => ProfilePageWidget(),
    //                       ));
    //                 }),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    // final blogs = Provider.of<List<Blog>>(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    labelColor: Color(0xFF8E24AA),
                    unselectedLabelColor: Color(0xFF95A1AC),
                    labelStyle: GoogleFonts.getFont(
                      'Roboto',
                    ),
                    indicatorColor: Color(0xFF8E24AA),
                    indicatorWeight: 3,
                    tabs: [
                      Tab(
                        text: 'My Feed',
                      ),
                      Tab(
                        text: 'Categories',
                      )
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F8),
                          ),

                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance.collection('blogs').snapshots(),
                            builder: (context, snapshot) {
                              return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot docblog = snapshot.data!
                                        .docs[index];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 6, 0, 0),
                                          child: Container(
                                            width:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.96,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  color: Color(0x2E000000),
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                              borderRadius: BorderRadius
                                                  .circular(8),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius
                                                      .only(
                                                    bottomLeft: Radius.circular(
                                                        0),
                                                    bottomRight: Radius
                                                        .circular(0),
                                                    topLeft: Radius.circular(8),
                                                    topRight: Radius.circular(
                                                        8),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/postBackground.jpg',
                                                    width:
                                                    MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width,
                                                    height: 300,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      12, 8, 12, 0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize
                                                        .max,
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        clipBehavior: Clip
                                                            .antiAlias,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape
                                                              .circle,
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/user.png',
                                                        ),
                                                      ),
                                                      Text(
                                                        docblog['title'],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      12, 4, 12, 0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize
                                                        .max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              0, 0, 0, 8),
                                                          child: Text(
                                                              docblog['description']),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  height: 3,
                                                  thickness: 1,
                                                  color: Color(0xFFE1E4E5),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      16, 0, 16, 4),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize
                                                        .max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize: MainAxisSize
                                                            .max,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                12, 0, 0, 0),
                                                            child: Text(
                                                              docblog['category'],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }
                              );
                            }
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 6, 0, 6),
                                child: Container(
                                  width:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.96,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x2E000000),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 1, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12, 8, 12, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/user.png',
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Text(
                                                  'userName',
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: Text(
                                                  '2h',
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12, 4, 12, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 8),
                                                  child: Text(
                                                    'We cleaned up a lot of visual clutter. There are fewer gray backgrounds and unnecessary divider lines. We also increased space to make text easier to read.',
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 3,
                                          thickness: 1,
                                          color: Color(0xFFE1E4E5),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 0, 16, 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 0, 16, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(4,
                                                              0, 0, 0),
                                                          child: Text(
                                                            '2,493',
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .mode_comment_outlined,
                                                        color:
                                                        Color(0xFF95A1AC),
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            4, 0, 0, 0),
                                                        child: Text(
                                                          '4',
                                                          // style:
                                                          // FlutterFlowTheme
                                                          //     .bodyText2
                                                          //     .override(
                                                          //   fontFamily:
                                                          //   'Lexend Deca',
                                                          //   color: Color(
                                                          //       0xFF8B97A2),
                                                          //   fontSize: 14,
                                                          //   fontWeight:
                                                          //   FontWeight
                                                          //       .normal,
                                                          // ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.ios_share,
                                                    color: Color(0xFF95A1AC),
                                                    size: 24,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFBA68C8), Color(0xFF8E24AA)]),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    tooltip: 'Home',
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlogDashboardWidget(),
                          ));
                    }),
                IconButton(
                    tooltip: 'Add post',
                    icon: Icon(Icons.add_circle),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddPostWidget(),
                          ));
                    }),
                IconButton(
                    tooltip: 'Profile',
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePageWidget(),
                          ));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/blog.dart';
// class BlogDashboardWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //final blogs = Provider.of<List<Blog>>(context);
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Blogs'),
//           actions: <Widget> [
//             // IconButton(icon:Icon(Icons.add, size: 30.0),
//             //   onPressed: () {
//             //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditBlog()));
//             //   },),
//             // IconButton(icon:Icon(Icons.account_circle, size: 30.0),
//             //   onPressed: (){
//             //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => userProfile()));
//             //   },)
//           ],
//         ),
//         body: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('blogs').snapshots(),
//           builder: (context, snapshot){
//             return ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, index){
//                 DocumentSnapshot docblog = snapshot.data!.docs[index];
//                 return ListTile(
//                     title: Text(docblog['title'],style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                     trailing: Text(docblog['category']),
//                     subtitle: Text(docblog['description'])
//                 );
//               },
//             );
//           },
//         )
//     );
//   }
// }
