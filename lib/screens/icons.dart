import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unicons/flutter_unicons.dart';
import 'package:flutter_unicons/model.dart';
import 'package:flutter_unicons_gallery/configs/constants.dart';
import 'package:flutter_unicons_gallery/configs/theme.dart';
import 'package:flutter_unicons_gallery/utils/helpers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recase/recase.dart';

part '../data/categories.dart';
part '../data/iconsByCategory.dart';

class IconsScreen extends StatefulWidget {
  @override
  _IconsScreenState createState() => _IconsScreenState();
}

class _IconsScreenState extends State<IconsScreen> with SingleTickerProviderStateMixin {
  TabController tabController;
  List<UniconDataModel> search = [],lineIcons = [],monochromeIcons;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: categories.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        searchBar(context),
        header(context),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              tabContent(context,IconsCategories.all),
              tabContent(context,IconsCategories.line),
              tabContent(context,IconsCategories.monochrome),
              tabContent(context,search),
            ]
          )
        )
      ],
    );
  }

  Widget searchBar(BuildContext context) => Padding(
    padding: kdefaultPaddingH.copyWith(top: 8,bottom: 8),
    child: Container(
      height: 42,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(.08),
        borderRadius: BorderRadius.circular(18)
      ),
      child: Row(
        children: [
          Expanded(child: TextFormField(
            expands: true,
            maxLines: null,
            onChanged: (val){
              setState(() {
                if(val.trim().isNotEmpty) search = _search(val);
                else search = [];
              });
              tabController.animateTo(3,duration: Duration(milliseconds: 300));
            },
            decoration: InputDecoration(
              hintText: "Type to search ...",
              hintStyle: GoogleFonts.quicksand(
                fontSize: bodyFz,
                fontWeight: semibold
              ),
              border: InputBorder.none,
            )
          )),
          Unicon(UniconData.uniSearchAlt,color: KColors.text,size: 20)
        ]
      )
    )
  );
  Widget header(BuildContext context) => TabBar(
    controller: tabController,
    isScrollable: true,
    indicatorSize: TabBarIndicatorSize.label,
    indicatorColor: Theme.of(context).primaryColor,
    labelColor: Theme.of(context).primaryColor,
    unselectedLabelColor: KColors.text,
    labelStyle: GoogleFonts.quicksand(
      fontSize: bodyFz,
      fontWeight: semibold
    ),
    tabs: categories.map((_tab) => Tab(
      text: Helpers.capitalize(_tab)
    )).toList(),
  );
  Widget tabContent(BuildContext context,List<UniconDataModel> icons) => icons.isNotEmpty ? GridView.count(
    crossAxisCount: 4,
    padding: kdefaultPadding,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    children: icons.map((e) => Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(.06),
        borderRadius: BorderRadius.circular(20)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FlatButton(
          onPressed: (){
            FocusScope.of(context).requestFocus(FocusNode());
            _showIcon(e,context);
          },
          padding: noPadding,
          child: Unicon(
            e,
            size: 24,
            color: KColors.accentText.withOpacity(.7)
          )
        ),
      )
    )).toList()
  ) : Center(
    child: Unicon(
      UniconData.uniLayersAltMonochrome,
      size: 40,
      color: KColors.text,
    )
  ) ;
  
  void _showIcon(UniconDataModel e,BuildContext context){
    showBottomSheet(context: context,builder: (context) => Container(
      height: 300,
      width: double.infinity,
      padding: kdefaultPadding.copyWith(top: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        ),
        boxShadow: [BoxShadow(
          blurRadius: 20,
          color: Colors.black.withOpacity(.3)
        )]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Helpers.capitalize(e.name),
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: semibold,
                  color: Theme.of(context).primaryColor
                )
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  padding: noPadding,
                  alignment: Alignment.centerRight,
                  icon: Unicon(
                    UniconData.uniTimes,
                    color: KColors.accentText,
                  ),
                )
              ),
            ],
          ),
          Expanded(child: Container(
            margin: EdgeInsets.only(bottom:8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(.04),
              borderRadius: BorderRadius.circular(18)
            ),
            child: Unicon(
              e,
              color: KColors.text,
              size: 80,
            )
          )),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(.04),
              borderRadius: BorderRadius.circular(18)
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "Unicon (UniconData."),
                  TextSpan(text: "uni"+Helpers.capitalize(e.name.camelCase)+")",style: TextStyle(
                    color: Theme.of(context).primaryColor
                  ))
                ],
                style: GoogleFonts.quicksand(
                  fontSize: bodyFz,
                  fontWeight: semibold,
                  color: KColors.text
                )
              )
            )
          )
        ]
      ),
    ));
  }
  List<UniconDataModel> _search(String val){
    List<UniconDataModel> temp = [];
    for (var item in IconsCategories.all) {
      if(item.name.contains(val)){
        temp.add(item);
      }
    }
    return temp;
  }
}