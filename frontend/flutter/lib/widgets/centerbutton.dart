import 'package:flutter/material.dart';

class Centerbutton extends StatelessWidget {
  const Centerbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 70, 
       height: 70,
       decoration: const BoxDecoration(
         color: Color(0xFF35D89A),
          shape: BoxShape.circle, 
          ), 
          child: const Icon( 
            Icons.add, 
            color: Colors.white, 
            size: 42 )
            );
  }
}

