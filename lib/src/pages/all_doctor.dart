import 'dart:io';

import 'package:doctordirectory/src/pages/search_mainpage.dart';
import 'package:doctordirectory/assets/models.dart';
import 'package:doctordirectory/assets/services.dart';
import 'package:doctordirectory/src/pages/full_profile.dart';
import 'package:doctordirectory/src/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:doctordirectory/src/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:progress_dialog/progress_dialog.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class AllDoctor extends StatefulWidget {
  AllDoctor() : super();

  @override
  _AllDoctorState createState() => _AllDoctorState();
}

class _AllDoctorState extends State<AllDoctor> {
  ProgressDialog progressDialog;

  List<Data> useData = new List<Data>();
  List<Data> _UseList = new List<Data>();
  List<Data> _Speciality = new List<Data>();
  List<String> specialityList = new List<String>();
  List<Specialties> useSpeciality = new List<Specialties>();
  List<Data> _FilterSearch = new List<Data>();
  List<Data> _Speciality2 = new List<Data>();

  Future LoadDoctor() async {
    Services.getDetails(http.Client()).then((Data) {
      setState(() {
        useData.addAll(Data);
        _UseList = useData;
        // print("p" + _UseList.length.toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    LoadDoctor();
  }

//GUI
  Widget _circularContainer(double height, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }

  Widget _card(
      {Color primaryColor = Colors.redAccent,
      String imgPath,
      Widget backWidget}) {
    return Container(
        height: 150,
        width: width * .34,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  color: Color(0x12000000))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: backWidget,
        ));
  }

  Widget _courceInfo(Data model, Widget decoration, {Color background}) {
    return Container(
        height: 190,
        width: width - 20,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: .7,
              child: _card(primaryColor: background, backWidget: decoration),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            model.profile.firstName +
                                " " +
                                model.profile.lastName,
                            style: TextStyle(
                                color: LightColor.purple,
                                fontSize: 16,
                                fontWeight:
                                    FontWeight.bold)), //Main Nae and surname
                      ),

                      CircleAvatar(
                        radius: 3,
                        backgroundColor: background,
                      ), //small dot
                      SizedBox(
                        width: 5,
                      ),
                      Text(model.profile.title,
                          style: TextStyle(
                            color: LightColor.grey,
                            fontSize: 14,
                          )),
                      SizedBox(width: 10)
                    ],
                  ),
                ),
                _SpecialityPrint(model),
                /*Text(model.specialties[0].actor,
                    style: AppTheme.h6Style.copyWith(
                      fontSize: 12,
                      color: LightColor.grey,
                    )),*/
                SizedBox(height: 10),
                Text("Practice at " + model.practices[0].name,
                    style: AppTheme.h6Style.copyWith(
                        fontSize: 12, color: LightColor.extraDarkPurple)),
                SizedBox(height: 10),
                Text(
                    model.practices[0].visitAddress.street +
                        " " +
                        model.practices[0].visitAddress.stateLong +
                        " " +
                        model.practices[0].visitAddress.state +
                        " " +
                        model.practices[0].visitAddress.zip,
                    style: AppTheme.h6Style.copyWith(
                        fontSize: 12, color: LightColor.extraDarkPurple)),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    _chip("More Details", LightColor.darkOrange,
                        height: 5), //small box 1
                    SizedBox(
                      width: 10,
                    ),
                    //_chip(model.tag2, LightColor.seeBlue, height: 5),
                  ],
                )
              ],
            ))
          ],
        ));
  }

  Widget _SpecialityPrint(Data model) {
    return new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: model.specialties.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(
            model.specialties[index].uid,
            style: AppTheme.h6Style.copyWith(
              fontSize: 12,
              color: LightColor.extraDarkPurple,
            ),
          );
        });
  }

  Widget _chip(String text, Color textColor,
      {double height = 0, bool isPrimaryCard = false}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: textColor.withAlpha(isPrimaryCard ? 200 : 50),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isPrimaryCard ? Colors.white : textColor, fontSize: 12),
      ),
    );
  }

  Widget _decorationContainerA() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -110,
          left: -85,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: LightColor.darkseeBlue,
          ),
        ),
        _smallContainer(LightColor.yellow, 40, 20),
        Positioned(
          top: -30,
          right: -10,
          child: _circularContainer(80, Colors.transparent,
              borderColor: Colors.white),
        ),
        Positioned(
          top: 110,
          right: -50,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: LightColor.darkseeBlue,
            child:
                CircleAvatar(radius: 40, backgroundColor: LightColor.seeBlue),
          ),
        ),
      ],
    );
  }

  Positioned _smallContainer(Color primaryColor, double top, double left,
      {double radius = 10}) {
    return Positioned(
        top: top,
        left: left,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: primaryColor.withAlpha(255),
        ));
  }

  BottomNavigationBarItem _bottomIcons(IconData icon) {
    return BottomNavigationBarItem(
        //  backgroundColor: Colors.blue,
        icon: Icon(icon),
        title: Text(""));
  }

  double width;
  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    progressDialog.style(
        message: 'Loading Directory...',
        borderRadius: 5,
        backgroundColor: Colors.white,
        progressWidget: SpinKitFoldingCube(
          size: 40.0,
          color: Colors.purpleAccent,
        ),
        elevation: 10.0,
        messageTextStyle: TextStyle(
            color: Colors.purple, fontSize: 13.0, fontWeight: FontWeight.w600));
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Doctor List"),
          centerTitle: true,
          elevation: 5,
        ),
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: LightColor.purple,
            unselectedItemColor: Colors.grey.shade300,
            type: BottomNavigationBarType.fixed,
            currentIndex: 1,
            items: [
              _bottomIcons(Icons.search),
              _bottomIcons(Icons.person),
            ],
            onTap: (index) {
              if (index == 0) {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JSONDemo(),
                    ));
                Timer(Duration(seconds: 10), () {
                  progressDialog.hide();
                });
                progressDialog.show();
              }
            }
            ),
        body: new ListView.builder(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          itemCount: _UseList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FullProfile(),
                            settings:
                                RouteSettings(arguments: _UseList[index])));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _courceInfo(_UseList[index], _decorationContainerA(),
                            background: LightColor.lightOrange)
                      ],
                    ),
                  ),
                ));
          },
        ));
  }
}
