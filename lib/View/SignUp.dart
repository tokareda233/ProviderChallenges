import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/CustomElevatedButton.dart';
import 'package:flutter_application_1/Components/TextField.dart';
import 'package:flutter_application_1/View/Login.dart';

class Signup extends StatelessWidget {
   GlobalKey<FormState>formKey =GlobalKey<FormState>();
   TextEditingController UserNameController=TextEditingController();
   TextEditingController EmailController=TextEditingController();
   TextEditingController PasswordController=TextEditingController();
   TextEditingController ConfirmPasswordController=TextEditingController();
   Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key:formKey ,
              child: Column(
                children: [
                  SizedBox(height: 75,),
                  Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  Text("Create your account"),
                  SizedBox(height: 30,),
                  CustomTextField(obsecure: false,preIcon: Icons.person, labell: "UserName",TextController: UserNameController,
                  validate:(UserNameController){
                    if(UserNameController==null){
                      return "value can not be null";
                    }
                    if(UserNameController.isEmpty){
                      return "value can not be empty";
                    }
                    return null;
                  },),
                  SizedBox(height: 10,),
                  CustomTextField(obsecure: false,preIcon: Icons.email, labell: "Email",TextController: EmailController,
                   validate:(EmailController){
                    if(EmailController==null){
                      return "value can not be null";
                    }
                    if(EmailController.isEmpty){
                      return "value can not be empty";
                    }
                    if(EmailController.contains("@")==false){
                      return "Invalid email format";
                    }
                    return null;
                  },
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(obsecure: false,preIcon: Icons.lock, labell: "Password",sufIcon: Icons.remove_red_eye_outlined,TextController: PasswordController,
                   validate:(PasswordController){
                    if(PasswordController==null){
                      return "value can not be null";
                    }
                    if(PasswordController.isEmpty){
                      return "value can not be empty";
                    }
                    if(PasswordController.length<6){
                      return "Enter more than 6 characters";
                    }
                    return null;
                  },
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(obsecure: false,preIcon: Icons.lock, labell: "Confirm Password",sufIcon: Icons.remove_red_eye_outlined,TextController: ConfirmPasswordController,
                   validate:(ConfirmPasswordController){
                    if(ConfirmPasswordController==null){
                      return "value can not be null";
                    }
                    if(ConfirmPasswordController.isEmpty){
                      return "value can not be empty";
                    }
                    if(ConfirmPasswordController.length<6){
                      return "Enter more than 6 characters";
                    }
                    if(ConfirmPasswordController!=PasswordController.text){
                        return "Not matching password";
                    }
                    return null;
                  },
                  ),
                  SizedBox(height:30,),
                  Customelevatedbutton(onPressed: (){
                    if(formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("created sucssesfuly")));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(Email: EmailController.text,Password: PasswordController.text,),));
                    }
                  },text: "Sign Up",),
                  SizedBox(height:40,),
                  Divider(endIndent:20 , indent: 20,),
                  SizedBox(height:30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Already have an account? "),
                      SizedBox(width: 3,),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login(Email: EmailController.text,Password: PasswordController.text,),));
                      }, child: Text("Login",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 17),))
                    ],
                  )
                ],
              ),
            ),
          ),
         ),
       
    );
  }
}