import 'package:flutter/material.dart';

class ProductSize extends StatelessWidget {
  const ProductSize({required this.size});

  final String size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.all(
          Radius.circular(40.0),
        ),
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      height: 60.0,
      width: 90.0,
      child: Center(
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              size,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
          ),
        ),
      ),
    );
  }
}
