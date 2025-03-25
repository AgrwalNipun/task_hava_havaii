import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_hava_havaii/api.dart';
import 'package:task_hava_havaii/data_model.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  double total =0;
  final data =getApi();
  @override
  Widget build(BuildContext context) {

return Scaffold(

  appBar: AppBar(
    backgroundColor: Colors.pink.shade100,
    leading: IconButton(onPressed: ()=>Navigator.of(context).pop(),
     icon: Icon(Icons.arrow_back)),
     title: Text("Cart"),
  ),

  backgroundColor: Colors.pink.shade100,
  body: SafeArea(child: Consumer(
    builder: (context, ref, child) =>
    FutureBuilder(
      future: data,
      builder:(context,snapshot) {
      
      if(snapshot.connectionState==ConnectionState.waiting){
        return CircularProgressIndicator();
      }
      else if(snapshot.hasData){
        final list = snapshot.data!["products"];
       return Column(

         children: [
           Expanded(
             child: ListView.builder(
              itemCount: ref.watch(mapProvider).length,
              itemBuilder: (context,index) { 
                   
                final productList = ref.watch(mapProvider).entries;
                final productEntry = productList.elementAt(index);
                final productId = productEntry.key;
                final product = list[productId-1];
                final discountedPrice = (product['price']*(100-product['discountPercentage'])/100);
                final discountedPriceString = discountedPrice.toStringAsFixed(2);
                total+=discountedPrice*productList.elementAt(index).value;
              return Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children:[ 
                    Image.network(product['thumbnail'],width: 150,),
                    SizedBox(
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product["title"]),
                          Text(product['brand']),
                          Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                        Text(product['price'].toString(),style: TextStyle(fontWeight: FontWeight.w200,fontSize: 10,decoration: TextDecoration.lineThrough,),),
                                        Text("\$$discountedPriceString"),
                                  ],
                                ),
                          Text("${product["discountPercentage"]}%\tOFF",style: TextStyle(color: Colors.red,fontSize:10),)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 222, 233),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                          children: [
                          IconButton(onPressed: (){
                            removeItem(ref, productId);
                            setState(() {
                              
                            });
                          }, icon: ImageIcon(
                            Image.asset("assets/minus-sign.png").image,
                            size: 20,
                          ),
                          style: ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                          ),
                          ),
                          Text(productList.elementAt(index).value.toString()),
                          IconButton(onPressed: (){
                            addItem(ref,productId );
                            setState(() {
                            });
                          }, icon: Icon(Icons.add),style: ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                          ),)
                        ],
                      ),
                    ),
                  ]),
              );
                   }
                   ),
           ),
        //  Expanded(child:SizedBox()),
         Container(
          height: 100,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Amount Price"),
                  Text("\$$total",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              )
            ],
          ),
         )
         
         ],
       );
      }
      else{
        return Text("error ocurred");
      }
      
      
      }
    ),),),
);

  }
}

