import 'dart:io';

import 'package:doctordirectory/src/pages/all_doctor.dart';
import 'package:doctordirectory/src/pages/search_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:doctordirectory/src/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import '../../assets/models.dart';
import '../../assets/services.dart';

class JSONDemo extends StatefulWidget {
  JSONDemo() : super();

  @override
  _JSONDemoState createState() => _JSONDemoState();
}

class _JSONDemoState extends State<JSONDemo> {
  final _debouncer = Debouncer(milliseconds: 500);
  ProgressDialog progressDialog;

  List<Data> useData = new List<Data>();
  List<Data> _UseList = new List<Data>();
  List<Data> _Speciality = new List<Data>();
  List<String> specialityList = new List<String>();
  List<Specialties> useSpeciality = new List<Specialties>();
  List<Data> _FilterSearch = new List<Data>();
  List<Data> _Speciality2 = new List<Data>();

  Future loadPerson() async {
    Services.getDetails(http.Client()).then((Data) {
      setState(() {
        useData.addAll(Data);
        _UseList = useData;
      });
      print(_UseList.length);

      for (var i = 0; i < _UseList.length; i++) {
        var temp = _UseList[i].specialties.length;

        if (temp != 0) {
          _Speciality2.add(_UseList[i]);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();

    loadPerson();



  }

//GUI
  double width;

  BottomNavigationBarItem _bottomIcons(IconData icon) {
    return BottomNavigationBarItem(icon: Icon(icon), title: Text(""));
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    progressDialog.style(
        message: 'Loading Directory...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: SpinKitFoldingCube(
          size: 40.0,
          color: Colors.purpleAccent,
        ),
        elevation: 10.0,
        messageTextStyle: TextStyle(
            color: Colors.purple, fontSize: 13.0, fontWeight: FontWeight.w600));
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Doctor Directory"),
        centerTitle: true,
        elevation: 5,
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: LightColor.purple,
          unselectedItemColor: Colors.grey.shade300,
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          items: [
            _bottomIcons(Icons.search),
            _bottomIcons(Icons.person),
          ],
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllDoctor(),
                  ));

              Timer(Duration(seconds: 10), () {
                progressDialog.hide();
              });
              progressDialog.show();
              /*     Future.delayed(Duration(seconds: 5)).then((value) {
                progressDialog.hide().whenComplete(() {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (BuildContext context) => AllDoctor()));
                });
              }*/
            }
          }),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              hintText: 'Search by Speciality',
            ),
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {

                  _Speciality2 = useData.where((u) =>
                          (u.uid.toLowerCase().contains(string.toLowerCase())))
                      .toList();
                });
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              itemCount: _Speciality2.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        var check = _Speciality2[index].specialties[0];

                        for (var i = 0; i < _UseList.length; i++) {
                          for (var j = 0;
                              j < _UseList[i].specialties.length;
                              j++) {
                            if (_UseList[i].specialties[j].uid == check.uid &&
                                _UseList[i].profile.firstName ==
                                    _Speciality2[i].profile.firstName) {
                              _FilterSearch.add(_UseList[i]);
                            }
                          }
                        }
                        for (var i = 0; i < _FilterSearch.length; i++) {
                          print(_FilterSearch[i].profile.firstName);
                        }

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchResult(),
                                settings:
                                    RouteSettings(arguments: _FilterSearch)));
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Text(
                                _Speciality2[index].specialties[0].uid,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.blue,
                                size: 30.0,
                              ),
                            ]),
                            Divider(
                              height: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
