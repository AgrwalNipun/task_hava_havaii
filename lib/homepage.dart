import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_hava_havaii/api.dart';
import 'package:task_hava_havaii/product_card.dart';
import 'package:task_hava_havaii/shopping_cart.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
   
final data = getApi();
  @override
  void initState() {
    // TODO: implement initState
    // data = getApi(context);
    // getApi();

    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: Text("Catalogue"),
        actions: [IconButton(
          onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShoppingCart())),
          icon :Icon(Icons.shopping_cart_outlined),
        )],

      ),
      body :
        Center(child:
        FutureBuilder(
          future: data,
         builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          else if(snapshot.hasData){
            return Container(
              child: 
              productCard(snapshot.data),
            );
          }
          else {
            return Text("Aerror");
          }
        })
        )
        

        );
        
        }
}