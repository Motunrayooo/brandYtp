import 'package:flutter/material.dart';
import 'package:shopytp2/widgets/bottom_navigation_bar.dart';
import 'package:shopytp2/widgets/background_container.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String id = 'CartScreen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundContainer(
              Container(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 12.0,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Cart',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(13.0),
                      ),
                      child: Container(
                        color: Colors.white,
                        height: 135.0,
                        width: 400.0,
                        child: Row(children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  color: Colors.grey,
                                  height: 100.0,
                                  width: 120.0,
                                ),
                              ),

                              Container(),
                            ],
                          ),
                        ],),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
