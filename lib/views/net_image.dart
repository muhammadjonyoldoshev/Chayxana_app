import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetImage extends StatelessWidget {
  final String imgUrl;
  final double height;
  final double width;
  final double borderRadius;

  const NetImage(
      {Key? key,
        // this.imgUrl = AppAssets.mainDefaultImage1,
        this.height = 50,
        this.width = 50,
        this.borderRadius = 12, required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const LoadingView(isLoading: true),
      errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            image: const DecorationImage(
              image: AssetImage("assets/images/im_gallery_photo2.png"),
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}

class LoadingView extends StatelessWidget {
  final bool isLoading;

  const LoadingView({Key? key, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container ();
    //isLoading
    //       ? Center(
    //     child: //Lottie.asset('assets/lottie/loading_lottie.json',
    //         width: 150, height: 150),
    //   )
    //       : const SizedBox.shrink();
  }
}