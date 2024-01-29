
import 'package:flutter/material.dart';

class Alerts {
    Alerts._();
 static Future<void>delete(BuildContext ctx)async {
      await showDialog(context: ctx,
        builder: (context) {
          return AlertDialog(
            title:const  Text('Delete'),
            content:const  CircularProgressIndicator(),
            actions: [
              TextButton(onPressed: (){}, child: const Text('Yes')),
              TextButton(onPressed: (){
                Navigator.pop(ctx);
              }, child:const  Text('No'),)
            ],
          );
        }
       );
       
       
       
       
       
       



 }

}