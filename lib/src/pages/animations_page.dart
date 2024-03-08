import 'package:flutter/material.dart';

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
 
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 4000)
    );

    rotation = Tween(begin: 0.0, end: 2.0).animate(animationController);

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
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: rotation.value, //aqui se pone la rotacion que definimos
          child: const _Rectangle(),
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