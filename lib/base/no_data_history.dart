import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/route_helper.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/app_icon.dart';

class NoDataHistory extends StatelessWidget {
  final String text;
  final String imgPath;
  const NoDataHistory({Key? key, required this.text,
    this.imgPath="assets/image/empty_cart.jpg"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // padding: EdgeInsets.only(top: Dimensions.height30+Dimensions.height10,left: Dimensions.width10,right: Dimensions.width10),
      color: Colors.white,
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: Dimensions.height45*3.5,),
          Image.asset(
            imgPath,
            height: MediaQuery.of(context).size.height*0.20,
            width: MediaQuery.of(context).size.width*0.20,
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          Text(
            text,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height*0.03,
              color: Theme.of(context).disabledColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign:TextAlign.center ,
          ),
        ],
      ),
    );

  }
}
