import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FashionDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fashion Category'),
          actions: <Widget>[],
          backgroundColor: Colors.purple,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('blogs').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              print(snapshot.data);
              return ListView(
                  children: [
                    ...snapshot.data!.docs.where((
                        QueryDocumentSnapshot<Object?>element) =>
                        element['category']
                            .contains('Fashion')).map((
                        QueryDocumentSnapshot<Object?> data) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(
                                0, 6, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context)
                                  .size
                                  .width *
                                  0.96,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x2E000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius:
                                BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsetsDirectional
                                        .fromSTEB(
                                        12, 8, 12, 0),
                                    child: Row(
                                      mainAxisSize:
                                      MainAxisSize.max,
                                      children: [
                                        Text(
                                          data['title'],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsetsDirectional
                                        .fromSTEB(
                                        12, 4, 12, 0),
                                    child: Row(
                                      mainAxisSize:
                                      MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional
                                                .fromSTEB(
                                                0,
                                                0,
                                                0,
                                                8),
                                            child: Text(data[
                                            'description']),
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
                                    EdgeInsetsDirectional
                                        .fromSTEB(
                                        16, 0, 16, 4),
                                    child: Row(
                                      mainAxisSize:
                                      MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          clipBehavior:
                                          Clip.antiAlias,
                                          decoration:
                                          BoxDecoration(
                                            shape:
                                            BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/fashion.png',
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize:
                                          MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  12,
                                                  0,
                                                  0,
                                                  0),
                                              child: Text(
                                                data[
                                                'category'],
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
                    })
                  ]);
            }
          },
        ));
  }
}
