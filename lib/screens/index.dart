import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_unicons/flutter_unicons.dart';
import 'package:flutter_unicons_gallery/configs/constants.dart';
import 'package:flutter_unicons_gallery/configs/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  List<Color> demoColors;
  Color iconsColor;
  double iconsSize = 28;
  @override
  void initState() {
    super.initState();
    iconsColor = Color(0xff222831);
    demoColors = [
      KColors.text,
      Color(0xffe7305b),
      Color(0xff01c5c4),
      Color(0xff0779e4),
      Color(0xfff0a500),
      Color(0xff222831),
    ];
  }
  @override
  Widget build(BuildContext context){  
    ScreenUtil.init(context);
    return AnnotatedRegion(
      value: systemStyle,
      child: Scaffold(
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              padding: kdefaultPadding,
              child:Column(
                children: [
                  Text(
                    "Flutter Unicons",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      fontSize: 30,
                      fontWeight: bold,
                      color: Theme.of(context).primaryColor
                    )
                  ),
                  SizedBox(height: 8),
                  Text(
                    "1000+ Pixel-perfect vector icons and Iconfont for your next flutter project.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      fontSize: bodyFz,
                      color: KColors.text
                    )
                  ),
                  demoBox(context),
                  colorPicker(context),
                  SizedBox(height: 20),
                  RichText(textAlign: TextAlign.center,text: TextSpan(
                    style: GoogleFonts.quicksand(
                      fontSize: bodyFz,
                      fontWeight: semibold,
                      color: KColors.text
                    ),
                    children: [
                      TextSpan(text: "Adapted to flutter by "),
                      TextSpan(text: "Charlot Tabade",style: TextStyle(
                        color: Theme.of(context).primaryColor
                      ))
                    ]
                  ))
                ]
              )
            )
          )
        )
      )
    );
  }
  Widget demoBox(BuildContext context) => Container(
    padding: EdgeInsets.all(12),
    margin: EdgeInsets.only(top: 50,bottom: 10),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor.withOpacity(.08),
      borderRadius: BorderRadius.circular(18)
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Unicon(UniconData.uniUser,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniSchedule,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniEditAlt,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniMessage,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniSetting,size: iconsSize,color:iconsColor),
          ]
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Unicon(UniconData.uniFacebookFMonochrome,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniGoogleDriveMonochrome,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniAdobeAltMonochrome,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniSnapchatSquareMonochrome,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniInstagramAltMonochrome,size: iconsSize,color:iconsColor),
          ]
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Unicon(UniconData.uniBriefcase,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniBill,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniBatteryBolt,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniBox,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniCloudSunRainAlt,size: iconsSize,color:iconsColor),
          ]
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Unicon(UniconData.uniWhatsappMonochrome,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniDribbbleMonochrome,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniAmazonMonochrome,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniGooglePlayMonochrome,size: iconsSize,color:iconsColor),
            Unicon(UniconData.uniSlackMonochrome,size: iconsSize,color:iconsColor),
          ]
        )
      ]
    )
  );
  Widget colorPicker(BuildContext context) => Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor.withOpacity(.08),
      borderRadius: BorderRadius.circular(18)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: demoColors.map((_color) => color(context,_color,demoColors.indexOf(_color)==demoColors.length)).toList()
    )
  );
  Widget color(BuildContext context,Color color,bool last) => GestureDetector(
    onTap: () => setState((){
      iconsColor = color;
    }),
    child: Container(
      height: 20,
      width: 20,
      /* margin: EdgeInsets.only(right: last ? 0 : 6), */
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    ),
  );
}