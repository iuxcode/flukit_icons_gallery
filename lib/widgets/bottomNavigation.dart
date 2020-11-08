import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_unicons/model.dart';
import 'package:flutter_unicons/unicons.dart';
import 'package:flutter_unicons_gallery/configs/theme.dart';

class NavigationBarItem{
  final UniconDataModel icon;
  final UniconDataModel selectedIcon;
  NavigationBarItem(this.icon, this.selectedIcon);
}

class NavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final double height,indicatorSize;
  final Duration duration;
  final List<NavigationBarItem> items;
  final Function(int) onChange;

  NavigationBar({
    this.defaultSelectedIndex = 0,
    this.height = 50,
    this.indicatorSize = 6,
    this.duration = const Duration(milliseconds: 300),
    this.onChange,
    @required this.items
  });
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int index = 0;
  List<NavigationBarItem> _items = [];

  @override
  void initState() {
    super.initState();
    index = widget.defaultSelectedIndex;
    _items = widget.items;
  }

  @override
  Widget build(BuildContext context){
    ScreenUtil.init(context);
    return Container(
      height: widget.height,
      margin: EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25)
        ),
        boxShadow: [BoxShadow(
          blurRadius: 10,
          color: Colors.black.withOpacity(.1)
        )]
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.center,children: _items.map(
            (_item) => item(context,_items.indexOf(_item),ScreenUtil().screenWidth/_items.length,_item)
          ).toList())
        ),
        Container(
          height: widget.indicatorSize,
          child: Stack(
            fit: StackFit.loose,
            children: [AnimatedPositioned(
              left: index * ScreenUtil().screenWidth/_items.length,
              duration: widget.duration,
              child: Container(
                height: widget.indicatorSize,
                width: ScreenUtil().screenWidth/_items.length,
                child: Center(
                  child: Container(
                    height: widget.indicatorSize,
                    width: (ScreenUtil().screenWidth/_items.length)/2,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                )
              )
            )]
          ),
        )
      ])
    );
  }
  Widget item(BuildContext context,int _index,double width,NavigationBarItem data) => GestureDetector(
    onTap: (){
      widget.onChange(_index);
      setState(() {
        index = _index;
      });
    },
    child: Container(
      height: widget.height,
      width: width,
      child: Unicon(
        index == _index ? data.selectedIcon : data.icon,
        /* fit: BoxFit.scaleDown, */
        size: 24,
        color: index == _index ? Theme.of(context).primaryColor : KColors.text,
      ),
    ),
  );
}