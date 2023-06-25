import 'package:flutter/material.dart';
import 'package:shopytp2/screens/product_details_screen.dart';
import '../constant.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GridCard extends StatefulWidget {
  const GridCard(
      {required this.id,
      required this.name,
      required this.image,
      required this.prize});

  final String id;
  final String name;
  final String image;
  final String prize;

  @override
  State<GridCard> createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.70,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: CachedNetworkImage(
                      imageUrl: widget.image,
                      height: MediaQuery.of(context).size.height * 0.26,
                      width: MediaQuery.of(context).size.height * 0.25,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 10.0,
                    right: 11.0,
                    child: GestureDetector(
                      child:  const Icon(
                        Icons.favorite_border,
                        size: 28.0,
                      ),
                      onTap: (){

                      },

                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.0,),

              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  widget.name,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),

              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      widget.prize,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(
                    width: 50.0,
                  ),
                  Text(
                    'Colors',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    width: 3.0,
                  ),
                  const Icon(
                    Icons.circle_rounded,
                    size: 30.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
