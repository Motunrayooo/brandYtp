import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:shopytp2/screens/product_details_screen.dart';
import 'package:shopytp2/widgets/three_card.dart';
import '../model/product_model.dart';
import 'grid_card.dart';

//what is the purpose of this class HomeWidget
//this file is for the tabBar view
// the tabBarView is for the landing location for each tabBar
class HomeWidget extends StatelessWidget {
// to pass a private variable to a constructor it has to be passed outside the constructor
// through a new public variable that will be declared  in the constructor,
// then outside the constructor  the new variable will be equal to the private variable
  const HomeWidget({Key? key, required Future<List<Product>> product})
      //i dont understand this part
      : _items = product,
        super(key: key);

  //a private can not be passed the same way a public variable is passed the constructor ie required this.

  final Future<List<Product>> _items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          //what is the purpose of the FutureBuilder & snapshot
          child: FutureBuilder<List<Product>>(
            future: _items,
            builder: (context, snapshot) {
              //the ConnectionState how did it come about
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(color: Colors.cyan);
              } else if (snapshot.hasError) {
                return Text(
                  'error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.white),
                );
              } else {
                final item = snapshot.data;

                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: item!.length,
                    itemBuilder: (context, index) {
                      //we declared and initialized the variable here again to access the index of the listviewBuilder
                      final item = snapshot.data![index];
                      return GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetailsScreen(id: item.id),),);},
                        child: GridCard(
                            id: item.id,
                            name: item.name,
                            image: item.imageUrl,
                            prize: item.price),
                      );
                    });
              }
            },
          ),
        ),
        const SizedBox(
          height: 7.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Latest products',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Row(
              children: [
                Text(
                  'Show all',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    AntIcons.caretRightFilled,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 110.0,
          child: ListView(scrollDirection: Axis.horizontal, children: const [
            ThreeCards(),
            ThreeCards(),
            ThreeCards(),
          ]),
        ),
      ],
    );
  }
}
