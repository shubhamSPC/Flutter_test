import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/login_activity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';


class dashboard extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<dashboard> {
  // late Future<GetClaimResponse> futureAlbum;
  // late GetClaimResponse detailsResponse;

  @override
  void initState() {
    super.initState();
    // futureAlbum = dashboardClaim();
    // print('future: $futureAlbum');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    getStringValuesSF();

    String? uname = RootApp.prefs.getString("UNAME");
    return new WillPopScope(
        onWillPop: () async => false,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Text('Dashboard'),
                actions: <Widget>[
                  // IconButton(
                  //   icon: Icon(Icons.more_vert),
                  //   onPressed: () {
                  //     showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) =>
                  //           _buildPopupDialog(context),
                  //     );
                  //   },
                  // ),
                ]),
            body: User(),
            drawer: Drawer(
              child: Column(children: <Widget>[
                Container(
                  height: 50,
                ),
                Container(
                  child: ListTile(
                    leading: Icon(
                      Icons.verified_user,
                      color: Colors.black,
                    ),
                    title: Text('Hi $uname', style: TextStyle(fontSize: 16)),
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => dashboard()));
                    },
                  ),
                ),
                Container(
                  child: SizedBox(
                    width: width,
                    height: 1.5,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(color: Color(0x27BDABAB)),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    title: Text('Logout', style: TextStyle(fontSize: 16)),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPopupDialog(context),
                      );
                    },
                  ),
                ),
                Container(
                  child: SizedBox(
                    width: width,
                    height: 1.5,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(color: Color(0x27BDABAB)),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }

  Future<void> getStringValuesSF() async {
    RootApp.prefs = await SharedPreferences.getInstance();
  }

  User() {
    return Scaffold(
        // backgroundColor: Color(0xEE1C2580),
    // body: Center(
    //
    // FutureBuilder<GetClaimResponse>(
    //     future: futureAlbum,
    //     builder: (context, snapshot) {
    //       print('Snapshot: $snapshot');
    //       if (snapshot.hasData) {
    //         if (snapshot.data!.ErrorCode == "1") {
    //           return Column(children: <Widget>[
    //             Text(
    //               'RecentClaim',
    //               textAlign: TextAlign.left,
    //               style: TextStyle(
    //                   color: Colors.white, fontWeight: FontWeight.w100),
    //             ),
    //             Expanded(
    //               // flex: 5,
    //               //add codition here
    //               child: ListView.builder(
    //                   itemCount: snapshot.data!.ResultObject!.length,
    //                   shrinkWrap: true,
    //                   padding: EdgeInsets.all(2),
    //                   itemBuilder: (BuildContext context, int index) {
    //                     return InkWell(
    //                         onTap: () {
    //                           Navigator.push(
    //                               context,
    //                               MaterialPageRoute(
    //                                   builder: (context) =>
    //                                       ClaimDetails(snapshot
    //                                           .data!
    //                                           .ResultObject![index]
    //                                           .id)));
    //                         },
    //                         child: Card(
    //                           margin: EdgeInsets.all(5.0),
    //                           elevation: 0.5,
    //                           child: Column(children: <Widget>[
    //                             Container(
    //                                 child: Padding(
    //                                   padding: EdgeInsets.only(
    //                                       top: 5.0, left: 5.0, bottom: 5.0),
    //                                   child: Row(
    //                                       crossAxisAlignment:
    //                                       CrossAxisAlignment.start,
    //                                       mainAxisAlignment:
    //                                       MainAxisAlignment.start,
    //                                       children: <Widget>[
    //                                         Container(
    //                                             child: Text(
    //                                               'Client: ',
    //                                               style: TextStyle(
    //                                                   fontWeight:
    //                                                   FontWeight.bold),
    //                                             )),
    //                                         Container(
    //                                             width:
    //                                             MediaQuery.of(context)
    //                                                 .size
    //                                                 .width *
    //                                                 0.8,
    //                                             child: Text(
    //                                               /*'Insurance Co 123'*/
    //                                                 snapshot
    //                                                     .data!
    //                                                     .ResultObject![
    //                                                 index]
    //                                                     .insured,
    //                                                 style: TextStyle()))
    //                                       ]),
    //                                 )),
    //                             Container(
    //                                 child: Padding(
    //                                   padding: EdgeInsets.only(
    //                                       left: 5.0, bottom: 5.0),
    //                                   child: Row(
    //                                       crossAxisAlignment:
    //                                       CrossAxisAlignment.start,
    //                                       mainAxisAlignment:
    //                                       MainAxisAlignment.start,
    //                                       children: <Widget>[
    //                                         Container(
    //                                             child: Text(
    //                                               'Claim: ',
    //                                               style: TextStyle(
    //                                                   fontWeight:
    //                                                   FontWeight.bold),
    //                                             )),
    //                                         Container(
    //                                             child: Text(
    //                                               /*'Claim 123'*/
    //                                                 snapshot
    //                                                     .data!
    //                                                     .ResultObject![
    //                                                 index]
    //                                                     .claimno +
    //                                                     ('(Ref: ' +
    //                                                         snapshot
    //                                                             .data!
    //                                                             .ResultObject![
    //                                                         index]
    //                                                             .referenceno +
    //                                                         ')'),
    //                                                 style: TextStyle(
    //                                                     wordSpacing: 2.0)))
    //                                       ]),
    //                                 )),
    //                             Container(
    //                                 child: Padding(
    //                                   padding: EdgeInsets.only(
    //                                       bottom: 5.0, left: 5.0),
    //                                   child: Row(
    //                                       crossAxisAlignment:
    //                                       CrossAxisAlignment.start,
    //                                       mainAxisAlignment:
    //                                       MainAxisAlignment.start,
    //                                       children: <Widget>[
    //                                         Container(
    //                                             child: Text(
    //                                               'Insurance: ',
    //                                               style: TextStyle(
    //                                                   fontWeight:
    //                                                   FontWeight.bold),
    //                                             )),
    //                                         Container(
    //                                             child: Text(
    //                                               /*'Insurance Co 123'*/
    //                                                 snapshot
    //                                                     .data!
    //                                                     .ResultObject![
    //                                                 index]
    //                                                     .insurancecompany,
    //                                                 style: TextStyle()))
    //                                       ]),
    //                                 )),
    //                           ]),
    //                         ));
    //                   }),
    //             )
    //           ]);
    //         } else {
    //           return Text(snapshot.data!.ErrorMessage);
    //         }
    //       } else if (snapshot.hasError) {
    //         return Text("${snapshot.error}");
    //       }
    //       return CircularProgressIndicator();
    //     }))
    );
    }
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Are you sure you want to Logout..? '),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => login_activity(),
              ),
            );
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Logout'),
        ),
      ],
    );
  }

