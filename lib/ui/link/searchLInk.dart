import 'package:flutter/material.dart';
import 'package:noppal_util/ui/bounce/npl_tap_bounce.dart';

class SearchLInk extends StatelessWidget {
  final Widget ? leading;
  final String  text;
  final List<Widget> ?  actions;
  final Color ? background;
  final Color ? textColor;
  final Color ? borderColor;
  final Function() ?  onTap;
  final double height;
  const SearchLInk(this.text,{ this.leading,this.actions,this.background,this.textColor,this.borderColor,this.onTap,this.height=40,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NplTapBounce(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 20,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 1.0,color: (borderColor!=null)?borderColor!:Colors.grey),
          color: background
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(leading!=null)...[
              Padding(
                padding: const EdgeInsets.only(),
                child: leading!,
              ),
            ],
            Text(
              text,
              style: TextStyle(fontSize: 15,color: textColor),
            ),
            if(actions!=null)...[
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: actions!,
              )
            ],

          ],
        ),
      ),
    );
  }
}
