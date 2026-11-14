import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/CustomElevatedButton.dart';
import 'package:flutter_application_1/Components/CustomTeam.dart';
import 'package:flutter_application_1/Providers/Addpoints.dart';
import 'package:flutter_application_1/Providers/passwordProvider.dart';
import 'package:provider/provider.dart';

class Basketball extends StatelessWidget {
  const Basketball({super.key});

  @override
  Widget build(BuildContext context) {
     Addpoints providerob = Provider.of<Addpoints>(context);
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.purple,title: Text("BasketBall"),centerTitle: true,),
        body: Column(
          children: [
            SizedBox(height: 100,),
            Row(
              children: [
                SizedBox(width: 70,),
                Customteam(onPressed:(points){
                  providerob.AddPoints_A(points);
                },  TeamName: "Team A", counter: providerob.count_A, ),
                SizedBox(width: 10,),
                Container(height: 290,width: 2,color: Colors.blueGrey,),
                SizedBox(width: 10,),
                Customteam(onPressed:(points){
                  providerob.AddPoints_B(points);
                },  TeamName: "Team B", counter: providerob.count_B, ),

              ],
              
            ),
            SizedBox(height: 50,),
            Customelevatedbutton(onPressed: (){
              providerob.reset();
            }, text: "Reset")
          ],
        ),
    );
  }
}