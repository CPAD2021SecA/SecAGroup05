
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blog_application/profilePage.dart';
import 'package:blog_application/createPost.dart';

class BlogDashboardWidget extends StatefulWidget {
  // const BlogDashboardWidget({Key key}) : super(key: key);

  @override
  _BlogDashboardWidgetState createState() => _BlogDashboardWidgetState();
}

class _BlogDashboardWidgetState extends State<BlogDashboardWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 44, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Welcome',
                        // style: FlutterFlowTheme.title1.override(
                        //   fontFamily: 'Lexend Deca',
                        //   color: Color(0xFF090F13),
                        //   fontSize: 24,
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Text(
                          '[userName]',
                          // style: FlutterFlowTheme.title1.override(
                          //   fontFamily: 'Lexend Deca',
                          //   color: Color(0xFFCD5E77),
                          //   fontSize: 24,
                          //   fontWeight: FontWeight.w500,
                          // ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          'Checkout news and highlights below.',
                          // style: FlutterFlowTheme.bodyText2.override(
                          //   fontFamily: 'Lexend Deca',
                          //   color: Color(0xFF8B97A2),
                          //   fontSize: 14,
                          //   fontWeight: FontWeight.w500,
                          // ),
                        ),
                      )
                    ],
                  )
                ],
              ),
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
                    labelColor: Color(0xFFCD5E77),
                    unselectedLabelColor: Color(0xFF95A1AC),
                    labelStyle: GoogleFonts.getFont(
                      'Roboto',
                    ),
                    indicatorColor: Color(0xFFCD5E77),
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.96,
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
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          '../assets/images/postBackground.jpg',
                                          // 'https://picsum.photos/seed/400/600',
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 300,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                '../assets/images/user.png',
                                              ),
                                            ),
                                            Text(
                                              'Hello World',
                                              // style: FlutterFlowTheme.bodyText1
                                              //     .override(
                                              //   fontFamily: 'Lexend Deca',
                                              //   color: Color(0xFF010000),
                                              //   fontSize: 20,
                                              //   fontWeight: FontWeight.bold,
                                              // ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                  // style: FlutterFlowTheme
                                                  //     .bodyText2
                                                  //     .override(
                                                  //   fontFamily: 'Lexend Deca',
                                                  //   color: Color(0xFF8B97A2),
                                                  //   fontSize: 14,
                                                  //   fontWeight:
                                                  //   FontWeight.normal,
                                                  // ),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    'userName',
                                                    // style: FlutterFlowTheme
                                                    //     .subtitle1
                                                    //     .override(
                                                    //   fontFamily: 'Lexend Deca',
                                                    //   color: Color(0xFF151B1E),
                                                    //   fontSize: 18,
                                                    //   fontWeight:
                                                    //   FontWeight.w500,
                                                    // ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 0, 0, 0),
                                                  child: Text(
                                                    '2h',
                                                    // style: FlutterFlowTheme
                                                    //     .bodyText2
                                                    //     .override(
                                                    //   fontFamily: 'Lexend Deca',
                                                    //   color: Color(0xFF8B97A2),
                                                    //   fontSize: 14,
                                                    //   fontWeight:
                                                    //   FontWeight.normal,
                                                    // ),
                                                  ),
                                                )
                                              ],
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
                                  MediaQuery.of(context).size.width * 0.96,
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
                                                  '../assets/images/user.png',
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Text(
                                                  'userName',
                                                  // style: FlutterFlowTheme
                                                  //     .subtitle1
                                                  //     .override(
                                                  //   fontFamily: 'Lexend Deca',
                                                  //   color: Color(0xFF151B1E),
                                                  //   fontSize: 18,
                                                  //   fontWeight: FontWeight.w500,
                                                  // ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: Text(
                                                  '2h',
                                                  // style: FlutterFlowTheme
                                                  //     .bodyText2
                                                  //     .override(
                                                  //   fontFamily: 'Lexend Deca',
                                                  //   color: Color(0xFF8B97A2),
                                                  //   fontSize: 14,
                                                  //   fontWeight:
                                                  //   FontWeight.normal,
                                                  // ),
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
                                                    // style: FlutterFlowTheme
                                                    //     .bodyText2
                                                    //     .override(
                                                    //   fontFamily: 'Lexend Deca',
                                                    //   color: Color(0xFF8B97A2),
                                                    //   fontSize: 14,
                                                    //   fontWeight:
                                                    //   FontWeight.normal,
                                                    // ),
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
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: Align(
              alignment: AlignmentDirectional(0, 1),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 100, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlogDashboardWidget(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.home_rounded,
                        color: Color(0xFFCD5E77),
                        size: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 100, 0),
                    child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreatePostWidget(),
                    ),
                    );
                    },
                    child: Icon(
                      Icons.add_rounded,
                      color: Color(0xFFCD5E77),
                      size: 25,
                    ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePageWidget(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.person_sharp,
                        color: Color(0xFFCD5E77),
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
