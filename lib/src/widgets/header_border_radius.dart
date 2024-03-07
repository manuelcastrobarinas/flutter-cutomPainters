import 'package:flutter/material.dart';

class HeaderBordeRedondeado extends StatelessWidget {
  const HeaderBordeRedondeado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
      color: Colors.deepPurple,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
        )
      ),
    );
  }
}