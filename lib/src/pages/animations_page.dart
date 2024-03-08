import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SquareAnimated(),
      ),
    );
  }
}

class SquareAnimated extends StatefulWidget {
  const SquareAnimated({super.key});

  @override
  State<SquareAnimated> createState() => _SquareAnimatedState();
}

class _SquareAnimatedState extends State<SquareAnimated> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  late Animation<double> moveRight;
  late Animation<double> zoom;
 
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 4000)
    );

    //rotation = Tween(begin: 0.0, end: 2.0 * math.pi).animate(animationController);// animaciones lineales
    rotation = Tween(begin: 0.0, end: 2.0 * math.pi).animate(
      CurvedAnimation(
      parent: animationController, 
      curve: Curves.easeOut
    )); // utiliza Una curva blesier para crear diferentes efectos de animacion

    opacity     = Tween(begin: 0.1, end: 1.0).animate(animationController);
    opacityOut  = Tween(begin: 0.7, end: 1.0).animate(animationController);
    moveRight = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceInOut));
    zoom      = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
      parent: animationController, 
      curve : Curves.easeInCubic
    ));

    animationController.addListener(() {
      if(animationController.status == AnimationStatus.completed) {
        animationController.reverse();
      }
     });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward(); //inicie la animacion
    return AnimatedBuilder(
      animation: animationController,
      child: const _Rectangle(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(moveRight.value, 0),
          child: Transform.rotate(
            angle: rotation.value, //aqui se pone la rotacion que definimos
            child: Opacity(
              opacity: opacity.value,
              child: Transform.scale(
                scale: zoom.value,
                child: Opacity(
                  opacity: opacityOut.value,
                  child: child
                )
              ),
            )
          ),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  const _Rectangle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width : 100,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}