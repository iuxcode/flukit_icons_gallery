import 'package:flutter/material.dart';
import 'package:flutter_unicons/flutter_unicons.dart';
import 'package:flutter_unicons/model.dart';
import 'package:flutter_unicons_gallery/configs/constants.dart';
import 'package:flutter_unicons_gallery/configs/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        padding: kdefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Installation",
              style: GoogleFonts.quicksand(
                fontSize: titleFz,
                fontWeight: bold,
                color: KColors.accentText
              )
            ),
            sep(
              context,
              color: Theme.of(context).primaryColor.withOpacity(.1),
              margin: EdgeInsets.only(top: 8,bottom: 20)
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "Add the dependency to your "),
                  TextSpan(text: "pubspec.yaml",style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: bold
                  )),
                ],
                style: GoogleFonts.quicksand(
                  fontSize: bodyFz,
                  color: KColors.text
                )
              )
            ),
            SizedBox(height: 12),
            bash(context,Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("dependencies :",style: GoogleFonts.quicksand(
                  color: KColors.accentText,
                  fontSize: bodyFz,
                  fontWeight: semibold
                )),
                SizedBox(height: 8),
                RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "   flutter_unicons : ",style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: bold
                    )),
                    TextSpan(text: "#version"),
                  ],
                  style: GoogleFonts.quicksand(
                    fontSize: bodyFz,
                    color: KColors.text
                  )
                )
            ),
              ]
            )),
            SizedBox(height: 20),
            Text(
              "Usage",
              style: GoogleFonts.quicksand(
                fontSize: titleFz,
                fontWeight: bold,
                color: KColors.accentText
              )
            ),
            sep(
              context,
              color: Theme.of(context).primaryColor.withOpacity(.1),
              margin: EdgeInsets.only(top: 8,bottom: 20)
            ),
            bash(context,Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "import  ",style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: bold
                      )),
                      TextSpan(text: "' package:flutter_unicons/flutter_unicons.dart ';",style: TextStyle(
                        color: Color(0xffe7305b),
                        fontWeight: bold
                      )),
                    ],
                    style: GoogleFonts.quicksand(
                      fontSize: bodyFz,
                      color: KColors.text
                    )
                  )
                ),
                SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Unicon ",style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: bold
                      )),
                      TextSpan(text: "( UniconData",style: TextStyle(
                        color: Theme.of(context).primaryColor
                      )),
                      TextSpan(text: ".uniLayerGroup )\n"),
                      TextSpan(text: "Unicon ",style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: bold
                      )),
                      TextSpan(text: "( UniconData",style: TextStyle(
                        color: Theme.of(context).primaryColor
                      )),
                      TextSpan(text: ".uniCommentAlt )"),
                    ],
                    style: GoogleFonts.quicksand(
                      fontSize: bodyFz,
                      fontWeight: semibold,
                      color: KColors.text
                    )
                  )
                )
              ]
            )),
            SizedBox(height: 20),
            RichText(
              text:TextSpan(
                children: [
                  TextSpan(
                   text: "Support the developer",
                    style: TextStyle(
                      color: KColors.accentText,
                      fontSize: titleFz,
                      fontWeight: bold
                    )
                  ),
                  TextSpan(text: " (star the project and follow me for more awesome work.)"),
                ],
                style: GoogleFonts.quicksand(
                  fontSize: bodyFz,
                  fontWeight: semibold,
                  color: KColors.text
                )
              )
            ),
            sep(
              context,
              color: Theme.of(context).primaryColor.withOpacity(.1),
              margin: EdgeInsets.only(top: 8,bottom: 20)
            ),
            bash(context, Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn(context,(){
                  launchURL("https://github.com/flutter/gallery/");
                },UniconData.uniGithub),
                btn(context,(){
                  launchURL("https://www.facebook.com/Charlot-tabade-100590685155564");
                },UniconData.uniFacebookF),
                btn(context,(){
                  launchURL("https://www.instagram.com/charlot_tabade/");
                },UniconData.uniInstagram),
                btn(context,(){
                  launchURL("https://twitter.com/CharlotTabade");
                },UniconData.uniTwitterAlt)
              ]
            )),
            SizedBox(height: 20),
            Text(
              "Licence",
              style: GoogleFonts.quicksand(
                fontSize: titleFz,
                fontWeight: bold,
                color: KColors.accentText
              )
            ),
            sep(
              context,
              color: Theme.of(context).primaryColor.withOpacity(.1),
              margin: EdgeInsets.only(top: 8,bottom: 20)
            ),
            Text("Flutter Unicons licensed under MIT.",style: GoogleFonts.quicksand(
              fontSize: bodyFz,
              fontWeight: semibold,
              color: KColors.text
            )),
            SizedBox(height: 3),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "Unicon ",style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: bold
                  )),
                  TextSpan(text: "licensed under Apache 2.0"),
                ],
                style: GoogleFonts.quicksand(
                  fontSize: bodyFz,
                  fontWeight: semibold,
                  color: KColors.text
                )
              )
            )
          ]
        )
      ),
    );
  }
  Widget sep(BuildContext context,{double height = 1,double width,EdgeInsets margin,Color color }) => Container(
    height: height,
    width: width,
    margin: margin,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8)
    )
  );
  Widget bash(BuildContext context,Widget child) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor.withOpacity(.08),
      borderRadius: BorderRadius.circular(18)
    ),
    child: child
  );
  Widget btn(BuildContext context,Function onPressed,UniconDataModel icon) => FlatButton(
    onPressed: onPressed,
    padding: noPadding,
    minWidth: 40,
    child: Unicon(
      icon,
      size: 25,
      color: KColors.text,
    )
  );

  launchURL(String url) async {
    if (await canLaunch(url))  await launch(url);
    else print('[-] Could not launch $url');
  }
}