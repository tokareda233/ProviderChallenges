import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/shoppingProvider.dart';
import 'package:flutter_application_1/View/shopping.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  List<Product>addedProducts;
   Cart({super.key,required this.addedProducts});
   

  @override
  Widget build(BuildContext context) {
    Shoppingprovider providerob = Provider.of<Shoppingprovider>(context);
    return Scaffold(
    appBar: AppBar(leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),title: Text("Cart",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: Colors.teal,),
    body: ListView.builder(itemCount: addedProducts.length,itemBuilder: (context, index) => Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(addedProducts[index].icon,color: Colors.teal,),
        title: Text(addedProducts[index].name,style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text("Price: \$${addedProducts[index].price}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: (){
              if(addedProducts[index].count>0){
                providerob.sub(addedProducts[index]);
              }else{
                addedProducts.remove(addedProducts[index]);
              }
            }, icon: Icon(Icons.remove_circle,color: Colors.red,)),
            Text("${addedProducts[index].count}"),
            IconButton(onPressed: (){
              providerob.Add(addedProducts[index]);
            }, icon: Icon(Icons.add_circle,color: Colors.teal,)),

          ],
        ),
      ),
    ),
    ),
    bottomNavigationBar: Container(
          height: 60,
          color: Colors.teal,
          child: Center(
          child: Text(
          "Total Price: \$${providerob.totalPrice(addedProducts)}",
          style: TextStyle(
          color: Colors.white,
          fontSize: 20,
         fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
    );
  }
}