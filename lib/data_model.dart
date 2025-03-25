

import 'package:flutter_riverpod/flutter_riverpod.dart';

// final productDataProvider = StateNotifierProvider((ref)=>productNotifier(
//    product(id: 1, quantity:0)
// ));


// class product {
// final id;
// int quantity;
// product( {required this.id,
//      required this.quantity});
// }

// class productNotifier extends StateNotifier{
//   productNotifier(super.state);
//   void addQuantity(int id){
//     state = product(id: id, quantity: state.quantity+1);
//   }
//   void removeQuantity(int id){
//       state = product(id: id, quantity: state.quantity1);
//   }

//}

final mapProvider = StateProvider<Map<int, int>>((ref) => {});

void addItem(WidgetRef ref, int id) {
  final newMap = Map<int, int>.from(ref.read(mapProvider));
  if(newMap.containsKey(id)){
    newMap[id] = newMap[id]!+1;
  }
  else{
  newMap[id] = 1;
  }
  ref.read(mapProvider.notifier).state = newMap;
}

void removeItem(WidgetRef ref, int key) {


  final newMap = Map<int, int>.from(ref.read(mapProvider));
  if(newMap[key]!>1){
  newMap[key] = newMap[key]!-1;
  }
  else{
    newMap.remove(key);
  }
  ref.read(mapProvider.notifier).state = newMap;
}

// double sum(WidgetRef ref){
//   Future.delayed(Duration(
//     seconds: 3
//   ));
//   final totalPrice = ref.read(totalProvider);
  
//   double total =0;
//   for(double d in totalPrice){
//     total+=d;
//   }
// print('total = $total');
//   return total;
// }