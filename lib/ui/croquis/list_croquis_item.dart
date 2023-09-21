


import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class ListCroquisItem extends StatelessWidget {
  final Color  backgroundColor;
  final int shimmerDuration;
  final Color shimmerColor;
  final Color gradientColor;
  final Curve curve;
  const ListCroquisItem({
    this.backgroundColor=Colors.grey,
    this.shimmerColor = Colors.white54,
    this.gradientColor = const Color.fromARGB(0, 244, 244, 244),
    this.curve = Curves.fastOutSlowIn,
    this.shimmerDuration = 1000,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10) ,
      leading: SkeletonAnimation(
        gradientColor: gradientColor,
        shimmerDuration: shimmerDuration,
        shimmerColor: shimmerColor,
        curve: curve,
        borderRadius: BorderRadius.circular(30),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: this.backgroundColor,
        ),
      ),
      title: SkeletonAnimation(
        borderRadius: BorderRadius.circular(2),
        gradientColor: gradientColor,
        shimmerDuration: shimmerDuration,
        shimmerColor: shimmerColor,
        curve: curve,
        child: Container(
          width: double.infinity,
          height: 15,
          padding: EdgeInsets.only(right: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: backgroundColor,
          ),
        ),
      ),
      subtitle: SkeletonAnimation(
        gradientColor:gradientColor,
        shimmerDuration: shimmerDuration,
        shimmerColor: shimmerColor,
        curve: curve,
        borderRadius: BorderRadius.circular(2),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
          color: backgroundColor,
          ),
          width: 100,
          height: 15,
        ),
      ),
      // trailing:  Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(2),
      //     color: backgroundColor,
      //   ),
      //   child: Text('       '),
      // ),
    );
  }
}
