import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';
import 'package:mvvm_moviecatalog_app/constants/my_deault_image_constant.dart';

class CacheImage extends StatelessWidget {
  CacheImage({super.key, required this.url, this.width, this.height});
  String? url;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CachedNetworkImage(
      width: width ?? size.width * 0.3,
      height: height ?? size.height * 0.2,
      imageUrl: url ?? MyDeaultImageConstant.imageUrl,
      errorWidget: (context, url, error) {
        return const Icon(MyCustomIcons.error, color: Colors.deepOrange);
      },
    );
  }
}
