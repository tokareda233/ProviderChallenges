import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/shopping.dart';

class Customcard extends StatelessWidget {
  final Product product;
  final Color color;
  final VoidCallback onPressed;
  const Customcard({super.key,required this.product,required this.color,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
     elevation: 2,
     child: Padding(
       padding: const EdgeInsets.all(10.0),
       child: Column(

        children: [
          SizedBox(height: 23,),
          Icon(product.icon,color: Colors.teal,size: 35,),
          Text(product.name,style: TextStyle(fontWeight: FontWeight.bold),),
          Text("\$${product.price}"),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: onPressed, child: Text(product.isAdded?"Added":"Add to Cart",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: color),)
        ],
       ),
     ),

    );
  }
}