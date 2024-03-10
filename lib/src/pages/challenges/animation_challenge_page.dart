//crear una animacion en 4 segundos que se mueva en forma de cuadrado partiendo de su punto inicial a derecha luego arriba luego izquierda y por ultimo llegue a su punto inicial

import 'package:flutter/material.dart';

class ChallengeAnimationPage extends StatelessWidget {
  const ChallengeAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ChallengeAnimation()
      ),
    );
  }
}

class ChallengeAnimation extends StatefulWidget {
  const ChallengeAnimation({super.key});

  @override
  State<ChallengeAnimation> createState() => _ChallengeAnimationState();
}

class _ChallengeAnimationState extends State<ChallengeAnimation> with SingleTickerProviderStateMixin {
  
  late AnimationController animationController;
  late Animation<double> moveRight;
  late Animation<double> moveUp;
  late Animation<double> moveLeft;
  late Animation<double> moveBottom;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000)); //especificamos el AnimationController
    moveRight = Tween(begin: 0.0, end: 120.0).animate(CurvedAnimation(
      parent: animationController, curve: const Interval(0.0, 0.25, curve: Curves.bounceOut)
    ));
    
    moveUp = Tween(begin: 0.0, end: 120.0).animate(CurvedAnimation(
      parent: animationController, curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)
    ));
   
    moveLeft = Tween(begin: 0.0, end: 120.0).animate(CurvedAnimation(
      parent: animationController, curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)
    ));
   
    moveBottom = Tween(begin: 0.0, end: 120.0).animate(CurvedAnimation(
      parent: animationController, curve: const Interval(0.75, 1, curve: Curves.bounceOut)
    ));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose(); // limpiar el controlador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder  : (context, child) {
        return Transform.translate(
          offset: Offset(moveRight.value, -moveUp.value) + Offset(-moveLeft.value, moveBottom.value),
          child: const _ChallengeContainer()
        );
      },
    );
  }
}

class _ChallengeContainer extends StatelessWidget {
  const _ChallengeContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width : 50,
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
    );
  }
}