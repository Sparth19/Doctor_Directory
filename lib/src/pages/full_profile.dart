import 'package:doctordirectory/assets/call_service.dart';
import 'package:doctordirectory/src/pages/search_mainpage.dart';
import 'package:doctordirectory/assets/models.dart';
import 'package:doctordirectory/assets/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctordirectory/src/theme/color/light_color.dart';
import 'package:doctordirectory/src/theme/theme.dart';
import 'package:share/share.dart';
import 'package:doctordirectory/src/pages/search_result.dart';

class FullProfile extends StatelessWidget {
  FullProfile({Key key}) : super(key: key);

  double width;
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  //design creative for orange box
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
    return Center(
      child: Container(
          height: 190,
          width: width * .34,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
          )),
    );
  }

  Widget _courceInfo(Data model, Widget decoration, {Color background}) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: width - 20,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _card(primaryColor: background, backWidget: decoration),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.green,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.call),
                          color: Colors.white,
                          tooltip: "Call Now",
                          onPressed: () {
                            callNow(model);

                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Center(
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.blue,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.share),
                          color: Colors.white,
                          tooltip: "Share Now",
                          onPressed: () {
                            shareDetails(model);
                          },
                        ),
                      ),
                    )
                  ],
                ),
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
                                fontSize: 20,
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
                            fontSize: 15,
                          )),
                      SizedBox(width: 15)
                    ],
                  ),
                ),
                SizedBox(height: 5),

                /*Text(model.specialties[0].actor,
                    style: AppTheme.h6Style.copyWith(
                      fontSize: 15,
                      color: LightColor.grey,
                    )),*/

                _SpecialityPrint(model),
                SizedBox(height: 5),
                Divider(
                  height: 5,
                  thickness: 2,
                  endIndent: 30,
                  indent: 30,
                ),
                SizedBox(height: 5),
                Text(
                    model.practices[0].visitAddress.stateLong +
                        " " +
                        model.practices[0].visitAddress.state,
                    style: AppTheme.h6Style.copyWith(
                      fontSize: 13,
                      color: LightColor.grey,
                    )),
                SizedBox(height: 10),
                Center(
                    child: Text("---------- Bio ----------",
                        textAlign: TextAlign.center,
                        style: AppTheme.h6Style.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: LightColor.extraDarkPurple))),
                SizedBox(height: 15),
                Text(model.profile.bio,
                    style: AppTheme.h6Style.copyWith(
                        fontSize: 13, color: LightColor.extraDarkPurple)),
                SizedBox(height: 15),
                Center(
                    child: Text("---------- Practice ----------",
                        textAlign: TextAlign.center,
                        style: AppTheme.h6Style.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: LightColor.extraDarkPurple))),
                SizedBox(height: 15),
                Text("At : " + model.practices[0].name,
                    style: AppTheme.h6Style.copyWith(
                        fontSize: 13, color: LightColor.extraDarkPurple)),
                SizedBox(height: 15),
                Text(
                    "Visit Address : " +
                        model.practices[0].visitAddress.street +
                        " " +
                        model.practices[0].visitAddress.stateLong +
                        " " +
                        model.practices[0].visitAddress.state +
                        " " +
                        model.practices[0].visitAddress.zip,
                    style: AppTheme.h6Style.copyWith(
                        fontSize: 13, color: LightColor.extraDarkPurple)),
                SizedBox(height: 15),
                Center(
                    child: Text(
                        "---------- Insurance Covered by Doctor ----------",
                        textAlign: TextAlign.center,
                        style: AppTheme.h6Style.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: LightColor.extraDarkPurple))),
                SizedBox(height: 15),
                _Insurance(model)
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
          return Text(model.specialties[index].uid,
              style: AppTheme.h6Style.copyWith(
                fontSize: 15,
                color: LightColor.grey,
              ));
        });
  }

  Widget _Insurance(Data model) {
    return new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: model.insurances.length,
        itemBuilder: (BuildContext context, int index) {
          return _chip(
              (index + 1).toString() +
                  ". " +
                  model.insurances[index].insurancePlan.name,
              Colors.deepOrange);
        });
  }

  //chip small button box definition
  Widget _chip(String text, Color textColor,
      {double height = 15, bool isPrimaryCard = false}) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: textColor.withAlpha(isPrimaryCard ? 200 : 50),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isPrimaryCard ? Colors.white : textColor, fontSize: 13),
      ),
    );
  }

  //creative design decorator for page 2
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

  //part of creative sesign

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

  @override
  Widget build(BuildContext context) {
    Data dataProfile = ModalRoute.of(context).settings.arguments;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Doctor Profile"),
          centerTitle: true,
        ),
        body: Container(
            child: InkWell(
                child: Padding(
          padding: EdgeInsets.all(1.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _courceInfo(dataProfile, _decorationContainerA(),
                    background: LightColor.lightOrange)
              ],
            ),
          ),
        ))));
  }

  void shareDetails(Data model) {
    String ans = "I m sharing Doctor Profile with you...\n" +
        "Name :" +
        model.profile.firstName +
        " " +
        model.profile.lastName +
        "\n\nBio :" +
        model.profile.bio +
        "\n\nContact Detail : " +
        model.practices[0].phones[0].number +
        "\n\nVisit Address : " +
        model.practices[0].visitAddress.street +
        " " +
        model.practices[0].visitAddress.stateLong +
        " " +
        model.practices[0].visitAddress.state +
        " " +
        model.practices[0].visitAddress.zip;
    Share.share(ans);
  }

  void callNow(Data model) {
    var  call=model.practices[0].phones[0].number;
    _service.call(call);
  }
}
