import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/route_helper.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/app_icon.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String imgPath;
  const NoDataPage({Key? key, required this.text,
    this.imgPath="assets/image/empty_cart.jpg"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.only(top: Dimensions.height30+Dimensions.height10,left: Dimensions.width10,right: Dimensions.width10),
          color: Colors.white,
          child:
          Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Positioned(
              top: Dimensions.height20*2,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon:Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconsize: Dimensions.iconSize24,
                  ),
                  SizedBox(width: Dimensions.width20*5,),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon:Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconsize: Dimensions.iconSize24,
                    ),
                  ),
                  AppIcon(icon:Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconsize: Dimensions.iconSize24,
                  ),
                ],
              )),
          SizedBox(height: Dimensions.height45+Dimensions.height30*3.5,),
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
