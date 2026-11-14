import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/shopping.dart';

class Shoppingprovider extends ChangeNotifier{
  
  void toggle(Product product){
    product.isAdded=!product.isAdded;
    notifyListeners();
  }
  void Add(Product product){
    product.count++;
    notifyListeners();
  }
  void sub(Product product){
    product.count--;
    notifyListeners();
  }
  double totalPrice(List<Product> l){
     double total=0;
     for(var item in l ){
      total+=item.count*item.price;
     }
     
     return total;
  }
}