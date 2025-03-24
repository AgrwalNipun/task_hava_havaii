import 'package:flutter/material.dart';

Widget productData(dynamic data){
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 310,mainAxisSpacing: 5,crossAxisSpacing: 5),

    itemCount: data["limit"],
    itemBuilder: (context,index){
      final product =data!["products"][index];
      final discountedPrice =(product['price']*(100-product['discountPercentage'])/100).toStringAsFixed(2);
      return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(product["thumbnail"],height: 200,),
                      Text(product["title"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                      Text(product['brand'],style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12),),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                              Text(product['price'].toString(),style: TextStyle(fontWeight: FontWeight.w200,fontSize: 10,decoration: TextDecoration.lineThrough,),),
                              Text("\$$discountedPrice"),
                        ],
                      ),
                      Text("${product["discountPercentage"]}%\tOFF",style: TextStyle(color: Colors.red,fontSize:10),)
                      
                    ],
                  )
                
                // child: Image.network(product["thumbnail"],height: 150,)),
              
          
      ); 
    });

} 