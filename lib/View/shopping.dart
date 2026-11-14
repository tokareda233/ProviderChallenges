import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/CustomCard.dart';
import 'package:flutter_application_1/Providers/shoppingProvider.dart';
import 'package:flutter_application_1/View/Cart.dart';
import 'package:provider/provider.dart';

class Product{
   IconData icon;
   String name;
   double price;
   bool isAdded=false;
   int count=1;
   Product({required this.icon,required this.name,required this.price,});
}

class Shopping extends StatelessWidget {
   Shopping({super.key});
List<Product>products=[
  Product(icon: Icons.watch,name: "Smart Watch",price: 150.00),
  Product(icon: Icons.headphones,name: "Head Phons",price: 250.00),
  Product(icon: Icons.laptop,name: "Laptop",price: 520.00),
  Product(icon: Icons.camera_alt_rounded,name: "Camera",price: 200.00),
  Product(icon: Icons.smartphone,name: "Smart Phone",price: 620.00),
  Product(icon: Icons.tablet,name: "Tablet",price: 400.00),

];

List<Product>Added=[];
  @override
  Widget build(BuildContext context) {
    Shoppingprovider providerob = Provider.of<Shoppingprovider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Shopping",style: TextStyle(color:Colors.white ),),centerTitle: true,backgroundColor: Colors.teal,),
     body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemCount: products.length,itemBuilder: (context, index) => Customcard(
      product: products[index], 
      color:products[index].isAdded?Colors.red:Colors.teal ,
      onPressed: (){
        providerob.toggle(products[index]);
       if(products[index].isAdded){
        Added.add(products[index]);
       }else{
        Added.remove(products[index]);
       }
      }
      ),
      ),
        floatingActionButton:FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(addedProducts: Added,),));
        },child: Icon(Icons.shopping_cart,color: Colors.teal,),) ,

        
    );
  }
}