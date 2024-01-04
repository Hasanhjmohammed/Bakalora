import 'package:flutter/material.dart';
CustomDrawer (){

  return  Drawer(

    child:Column(
      children: [
        Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerHeader(
                  decoration:const  BoxDecoration(
                      color: Colors.orange
                  ),
                  child:   Align(
                  alignment: Alignment.topLeft,
                  child:  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 45,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage:AssetImage('images/img_5.png',),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                ),
                Padding(padding: EdgeInsets.only( bottom: 20,left: 20),child:   Text('Hasan Jaffer Hj Mohammed',

                  style: TextStyle(),),)
                //  Text('hasanjafferhjmohammed@gmail.com'),
              ],
            )
        ),
        // Container(height:250),
        Expanded(
          flex:3,

          child:   Container(
            child: Column(
              children: [

              ],

            ),
          ),),
        Divider(

        ),
        Expanded(
          flex:1,
          child:   Container(
            child:Column(children: [
            ],),
          ),)

      ],
    ) ,
  );
}