import 'package:background_custom_painters/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderModel(),
      child: const Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: _Slides()
              ),
              _Dots()
            ],
          )
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          _Dot(index: 0),
          _Dot(index: 1),
          _Dot(index: 2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot({required this.index});

  @override
  Widget build(BuildContext context) {
    final double pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5) ? Colors.blue : Colors.grey
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides();

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  
  final PageController pageViewController = PageController();
  
  @override
  void initState() {
    
    pageViewController.addListener(() { 
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page!;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PageView(
        controller: pageViewController,
        children: const [
         _ImageSlide(imageAsset: "assets/svg/slide-1.svg"),
         _ImageSlide(imageAsset: "assets/svg/slide-2.svg"),
         _ImageSlide(imageAsset: "assets/svg/slide-3.svg"),
        ]
      ),
    );
  }
}

class _ImageSlide extends StatelessWidget {
  final String imageAsset;

  const _ImageSlide({
    required this.imageAsset
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding : const EdgeInsets.all(20),
      width : double.infinity,
      height: double.infinity,
      child : SvgPicture.asset(imageAsset),
    );
  }
}