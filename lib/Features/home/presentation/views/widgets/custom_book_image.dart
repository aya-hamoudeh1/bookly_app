import 'package:flutter/material.dart';
import '../../../../../Core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7/4,
      child: Container(
        height: MediaQuery.of(context).size.height*.25,
        width: 100,
        decoration:  BoxDecoration(
          borderRadius:BorderRadius.circular(16),
          color: Colors.red,
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsData.test),
          ),
        ),
      ),
    );
  }
}