import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/CustomElevatedButton.dart';
import 'package:flutter_application_1/Providers/Addpoints.dart';
import 'package:flutter_application_1/Providers/passwordProvider.dart';
import 'package:provider/provider.dart';

class Customteam extends StatelessWidget {
  final String TeamName;
 
  final int counter;
   final Function(int) onPressed;
   const Customteam({super.key,required this.onPressed,required this.TeamName,required this.counter,});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
       children: [
        Text(TeamName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        SizedBox(height: 25,),
        Text("$counter",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
        SizedBox(height: 20,),
        Customelevatedbutton(onPressed:(){
          onPressed(1);
        } , text: "Add 1 point"),
        SizedBox(height: 20,),
        Customelevatedbutton(onPressed:(){
          onPressed(2);
        } , text: "Add 2 points"),
        SizedBox(height: 20,),
        Customelevatedbutton(onPressed:(){
          onPressed(3);
        } , text: "Add 3 points"),
       ],
      ),
    );
  }
}