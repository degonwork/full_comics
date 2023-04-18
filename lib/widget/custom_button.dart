import 'package:flutter/material.dart';
import 'package:full_comics/config/size_config.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CustomButton({super.key, required this.onPressed,required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight / 15.12,
      width: SizeConfig.screenWidth / 1.2,
      child: MaterialButton(
        onPressed: onPressed,
        color: Colors.yellow,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        child: Text(text),
        ),
    );
  }
}