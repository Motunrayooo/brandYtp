import 'dart:developer';
import 'package:shopytp2/service/service.dart';
import 'package:flutter/material.dart';
import 'package:shopytp2/widgets/home_widget.dart';
//where did we pass the instance of this class in this file
import '../model/product_model.dart';
import '../widgets/grid_card.dart';
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:shopytp2/widgets/three_card.dart';


class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 3, vsync: this);
  //to retrieve data from the service class and will later used in the future builder
  late final Future<List<Product>> _towels;
  late final Future<List<Product>> _bathrobes;
  late final Future<List<Product>> _beddings;

  void getTowelsProduct(){
    _towels = Helper().getTowels();
  }
  void getBathrobesProduct(){
    _bathrobes = Helper().getBathrobes();
  }
  void getBeddingsProduct(){
    _beddings = Helper().getBeddings();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTowelsProduct();
    getBathrobesProduct();
    getBeddingsProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              height: 800.0,
              width: 710.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/background_portrait.jpg',
                  ),
                ),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'YourTowelPlug',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'Collections',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      padding: EdgeInsets.zero,
                      indicatorColor: Colors.transparent,
                      labelStyle: Theme.of(context).textTheme.headlineSmall,
                      controller: tabController,
                      tabs: const [
                        Tab(
                          text: 'Towel',
                        ),
                        Tab(text: 'Bathrobe'),
                        Tab(text: 'Beddings'),
                      ],
                    ),

                  ],
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 170.0),
              child: Container(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    HomeWidget(product: _towels),
                    HomeWidget(product: _bathrobes),
                    HomeWidget(product: _beddings),




                  ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
