import 'package:flutter/material.dart';
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:shopytp2/widgets/product_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shopytp2/model/product_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../service/service.dart';
import '../widgets/button.dart';
import '../widgets/color_icon.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({required this.id});

  final String id;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late Future<Product> _singleProduct;

  void getSingleProduct(String id) {
    if (id == id) {
      _singleProduct = Helper().getSingleTowel(id);
    } else if (id == id) {
      _singleProduct = Helper().getSingleBathrobe(id);
    } else {
      _singleProduct = Helper().getSingleBeddings(id);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSingleProduct(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      // appBar: AppBar(
      //
      //   elevation: 0,
      //   backgroundColor: Colors.grey.shade200,
      //   leading:
      //   GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: const Icon(
      //       AntIcons.closeOutlined,
      //       color: Colors.black,
      //     ),
      //   ),
      //   actions: const [
      //     Icon(
      //       AntIcons.ellipsisOutlined,
      //       color: Colors.black,
      //       size: 40.0,
      //     ),
      //   ],
      // ),
      body: FutureBuilder<Product>(
        future: _singleProduct,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('error:${snapshot.error}');
          } else {
            final data = snapshot.data;
            print(data);
            return CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  snap: false,
                  expandedHeight: MediaQuery.of(context).size.height,
                  automaticallyImplyLeading: false,
                  leadingWidth: 0.0,
                  backgroundColor: Colors.transparent,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          AntIcons.closeOutlined,
                          color: Colors.black,
                        ),
                      ),
                      const Icon(
                        AntIcons.ellipsisOutlined,
                        color: Colors.black,
                        size: 40.0,
                      ),
                    ],
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*0.51,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: Colors.grey.shade400),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: data!.imageUrl,
                          ),
                        ),

                        Positioned(
                          bottom: 1.0,
                          // bottom: 10.0,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(6.0, 6.0),
                                      blurRadius: 5.0,
                                      color: Colors.grey,
                                    ),
                                  ]),
                              height: MediaQuery.of(context).size.height*0.64,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data!.name,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  RatingBar.builder(
                                      itemCount: 5,
                                      maxRating: 1,
                                      initialRating: 3,
                                      itemSize: 22.0,
                                      allowHalfRating: true,
                                      direction: Axis.horizontal,
                                      itemBuilder: (context, _) {
                                        return const Icon(
                                          Icons.star,
                                          size: 18.0,
                                          color: Colors.black,
                                        );
                                      },
                                      onRatingUpdate: (motun) {}),
                                  const SizedBox(
                                    height: 25.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data!.price,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontSize: 28.0),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Colors',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(color: Colors.black),
                                            ),
                                            const ColourIcon(
                                              Colors.black,
                                            ),
                                            const ColourIcon(
                                              Colors.red,
                                            ),
                                            const ColourIcon(
                                              Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25.0,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Select Sizes',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(color: Colors.black),
                                      ),
                                      const SizedBox(
                                        width: 40.0,
                                      ),
                                      Text(
                                        'View size guide',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15.0),
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: data.size.length,
                                          itemBuilder: (context, index) {
                                            //the variable is to access the index in the list of size
                                            final size = data.size[index];
                                            return ProductSize(size: size['size']);
                                          }),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                   Dividerr(),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      data.description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 37.0,
                                  ),
                                  Center(
                                    child: Button(
                                      onTap: () {},
                                      title: 'Add to Cart',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              // child: Stack(
              //   children: [
              //     Container(
              //       height: MediaQuery.of(context).size.height * 0.41,
              //       width: MediaQuery.of(context).size.width,
              //       decoration: BoxDecoration(color: Colors.grey.shade400),
              //       // height: 200.0,
              //       child: CachedNetworkImage(
              //         fit: BoxFit.fill,
              //         imageUrl: data!.imageUrl,
              //       ),
              //     ),
              //     Positioned(
              //       top: MediaQuery.of(context).size.height * 0.30,
              //       // bottom: 10.0,
              //       child: ClipRRect(
              //         borderRadius: const BorderRadius.only(
              //           topLeft: Radius.circular(30.0),
              //           topRight: Radius.circular(30.0),
              //         ),
              //         child: Container(
              //           padding: const EdgeInsets.all(8.0),
              //           decoration: const BoxDecoration(
              //               color: Colors.white,
              //               boxShadow: [
              //                 BoxShadow(
              //                   offset: Offset(6.0, 6.0),
              //                   blurRadius: 5.0,
              //                   color: Colors.grey,
              //                 ),
              //               ]),
              //           height: 533.0,
              //           width: MediaQuery.of(context).size.width,
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 data!.name,
              //                 style: Theme.of(context).textTheme.titleLarge,
              //               ),
              //               const SizedBox(
              //                 height: 6.0,
              //               ),
              //               RatingBar.builder(
              //                   itemCount: 5,
              //                   maxRating: 1,
              //                   initialRating: 3,
              //                   itemSize: 22.0,
              //                   allowHalfRating: true,
              //                   direction: Axis.horizontal,
              //                   itemBuilder: (context, _) {
              //                     return const Icon(
              //                       Icons.star,
              //                       size: 18.0,
              //                       color: Colors.black,
              //                     );
              //                   },
              //                   onRatingUpdate: (motun) {}),
              //               const SizedBox(
              //                 height: 25.0,
              //               ),
              //               Row(
              //                 mainAxisAlignment:
              //                     MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text(
              //                     data!.price,
              //                     style: Theme.of(context)
              //                         .textTheme
              //                         .titleMedium!
              //                         .copyWith(fontSize: 28.0),
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsets.symmetric(
              //                         horizontal: 8.0),
              //                     child: Row(
              //                       children: [
              //                         Text(
              //                           'Colors',
              //                           style: Theme.of(context)
              //                               .textTheme
              //                               .titleSmall
              //                               ?.copyWith(color: Colors.black),
              //                         ),
              //                         const ColourIcon(
              //                           Colors.black,
              //                         ),
              //                         const ColourIcon(
              //                           Colors.red,
              //                         ),
              //                         const ColourIcon(
              //                           Colors.green,
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               const SizedBox(
              //                 height: 25.0,
              //               ),
              //               Row(
              //                 children: [
              //                   Text(
              //                     'Select Sizes',
              //                     style: Theme.of(context)
              //                         .textTheme
              //                         .titleSmall
              //                         ?.copyWith(color: Colors.black),
              //                   ),
              //                   const SizedBox(
              //                     width: 40.0,
              //                   ),
              //                   Text(
              //                     'View size guide',
              //                     style: Theme.of(context)
              //                         .textTheme
              //                         .titleSmall
              //                         ?.copyWith(fontWeight: FontWeight.bold),
              //                   ),
              //                 ],
              //               ),
              //               const SizedBox(
              //                 height: 10.0,
              //               ),
              //               SizedBox(
              //                 height: 40.0,
              //                 child: Padding(
              //                   padding: const EdgeInsets.only(left: 15.0),
              //                   child: ListView.builder(
              //                       scrollDirection: Axis.horizontal,
              //                       itemCount: data.size.length,
              //                       itemBuilder: (context, index) {
              //                         //the variable is to access the index in the list of size
              //                         final size = data.size[index];
              //                         return ProductSize(size: size['size']);
              //                       }),
              //                 ),
              //               ),
              //               const SizedBox(
              //                 height: 10.0,
              //               ),
              //               const SizedBox(
              //                 height: 10.0,
              //                 child: Divider(
              //                   color: Colors.black45,
              //                   endIndent: 10.0,
              //                   indent: 10.0,
              //                   thickness: 2.0,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 10.0,
              //               ),
              //               SizedBox(
              //                 child: Text(
              //                   data.description,
              //                   style: Theme.of(context)
              //                       .textTheme
              //                       .titleMedium!
              //                       .copyWith(fontWeight: FontWeight.w400),
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 7.0,
              //               ),
              //               Center(
              //                 child: Button(
              //                   onTap: () {},
              //                   title: 'Add to Cart',
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            );
          }
        },
      ),
    );
  }
}

class Dividerr extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: 10.0,
     child: Divider(
       color: Colors.black45,
       endIndent: 10.0,
       indent: 10.0,
       thickness: 2.0,
     ),
                                  );
  }
}
