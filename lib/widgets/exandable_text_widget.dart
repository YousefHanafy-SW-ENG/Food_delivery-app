import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/utils/colors.dart';
import 'package:shopapp/utils/dimensions.dart';
import 'package:shopapp/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key,required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText=true;

  double textHeight = Dimensions.screenHeight/5.63;
  // i love flutter laravel and golang 30  50
  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
       firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }else{
      firstHalf= widget.text;
      secondHalf="";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(height:1.8,color: AppColors.paragColor,size: Dimensions.font16,text: firstHalf):Column(
        children: [
          SmallText(height:1.8,color: AppColors.paragColor,size: Dimensions.font16,text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState((){
                hiddenText=!hiddenText;
              }
              );
            },
            child: Row(
              children: [
                SmallText(text:hiddenText?"Show more":"Show less",color: AppColors.mainColor),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColors.mainColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
