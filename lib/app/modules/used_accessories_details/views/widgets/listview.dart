import 'package:flutter/material.dart';
import 'swiper.dart';
import 'galleryWidgetItem.dart';

class ImageThumbCarouselWidget extends StatefulWidget {
  final List galleriesList;
  final bool isInside;
  final url;
  ImageThumbCarouselWidget(
      {Key key, this.galleriesList, this.url, this.isInside})
      : super(key: key);

  @override
  _ImageThumbCarouselWidgetState createState() =>
      _ImageThumbCarouselWidgetState();
}

class _ImageThumbCarouselWidgetState extends State<ImageThumbCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: widget.isInside == true ? height * .37 : 200,
      width: width,
      child: InteractiveViewer(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.galleriesList.length,
          itemBuilder: (context, index) {
            return InkWell(
              splashColor: Theme.of(context).accentColor.withOpacity(0.8),
              highlightColor: Colors.transparent,
              // onTap: () {

              // },
              child: GalleryItemWidget(
                image: widget.url.toString() +
                    widget.galleriesList.elementAt(index)['imageURL'],
                isInside: widget.isInside,
              ),
            );
          },
        ),
      ),
    );
  }
}
