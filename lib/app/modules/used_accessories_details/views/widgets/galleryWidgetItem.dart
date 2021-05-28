import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GalleryItemWidget extends StatelessWidget {
  final image;
  final bool isInside;
  GalleryItemWidget({Key key, this.image, this.isInside}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(image);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return image == null
        ? null
        : Container(
            height: height * .25,
            width: width,
            // width: 250,
            // width: isInside == true ? width : 250,
            // height: isInside == true ? height * .37 : 200,
            // height: isInside == true ? height * .6 : null,
            margin: EdgeInsets.only(left: 6, right: 6),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).accentColor.withOpacity(0.1),
                    blurRadius: 15,
                    offset: Offset(0, 5)),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                width: width,

                fit: BoxFit.cover,
                height: height * .27,

                //border: Border.all(color: Colors.red, width: 1.0),
                // shape: boxShape,

                //cancelToken: cancellationToken,
              ),
            )
            // PhotoView.customChild(
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.all(Radius.circular(5)),
            //       child: CachedNetworkImage(
            //         fit: BoxFit.cover,
            //         imageUrl: gallery.image.url,
            //         placeholder: (context, url) => Image.asset(
            //           'assets/img/loading.gif',
            //           fit: BoxFit.cover,
            //         ),
            //         errorWidget: (context, url, error) => Icon(Icons.error),
            //       ),
            //     ),
            //   )

            );
  }
}
