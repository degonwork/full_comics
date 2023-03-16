import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextFiled extends StatefulWidget {
  final TextEditingController? controller;
  final bool? obscure;
  
  const CustomTextFiled({super.key, this.controller , this.obscure});

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  late bool obsc = widget.obscure ?? false;
  
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      
      validator: (value) => value!.isEmpty ? 'Please enter email' : null,
      obscureText: obsc,
      controller: widget.controller,
      decoration: InputDecoration(
       
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:const BorderSide(color: Colors.blue,width:1.6),
        )
      ),
    );
  }
}