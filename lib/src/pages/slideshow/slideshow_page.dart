import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/widgets.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(child: _MyPersonalSlideshow()),
          Expanded(child: _MyPersonalSlideshow()),
        ],
      )
    );
  }
}

class _MyPersonalSlideshow extends StatelessWidget {
  const _MyPersonalSlideshow();

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      pointsUp: true,
      pointsEnabledColor: Colors.pink,
      slides: [
        SvgPicture.asset("assets/svg/slide-1.svg"),
        SvgPicture.asset("assets/svg/slide-2.svg"),
        SvgPicture.asset("assets/svg/slide-3.svg"),
        SvgPicture.asset("assets/svg/slide-4.svg"),
        SvgPicture.asset("assets/svg/slide-5.svg"),
      ]
    );
  }
}