import 'package:flutter/material.dart';
import 'package:noppal_util/ui/croquis/list_croquis_item.dart';

class ListCroquisSliver extends StatelessWidget {
  final int taille;
  final Color backgroundColor;
  final int shimmerDuration;
  final Color shimmerColor;
  final Color gradientColor;
  final Curve curve;
  const ListCroquisSliver(this.taille,{
    this.backgroundColor=Colors.grey,
    this.shimmerColor = Colors.white54,
    this.gradientColor = const Color.fromARGB(0, 244, 244, 244),
    this.curve = Curves.fastOutSlowIn,
    this.shimmerDuration = 1000,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverList(
        delegate: SliverChildBuilderDelegate(
              (BuildContext context,int index){
            return ListCroquisItem(
              backgroundColor: backgroundColor,
              shimmerDuration: shimmerDuration,
              shimmerColor: shimmerColor,
              gradientColor: gradientColor, curve: curve,
            );
          },
          childCount: taille,
        )
    );;
  }
}
