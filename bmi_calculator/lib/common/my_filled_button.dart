import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback onPressed;
  const MyFilledButton({super.key, this.child, required this.onPressed, required BorderRadius borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(onPressed: onPressed,style: ElevatedButton.styleFrom(
backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ), child: child,),
      
    );
  }
}