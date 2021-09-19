import 'package:flutter/cupertino.dart';

class Cart {
  final String id;
  final int quantity;
  final String title;
  final double price;
  Cart({
    required this.price,
    required this.title,
    required this.id,
    required this.quantity,
  });
}

class CartProvider with ChangeNotifier{
  Map<String, Cart> _cartitems={

  };

  Map<String, Cart> get cartitems{
    return {..._cartitems};
  }

  void addtocart(var productID, double price, String title){
    if(_cartitems.containsKey(productID)){
      _cartitems.update(productID, (value) => Cart(id: value.id, price: value.price, quantity: value.quantity+1, title: value.title));

    }
    else{
      _cartitems.putIfAbsent(productID, () => Cart(id: DateTime.now().toString(), title: title, price: price, quantity: 1 ));
    }
    notifyListeners();

  }
  double totalamount()
  {
    var totalprice=0.0;
    _cartitems.forEach((key, value) { 
      totalprice+=value.price*value.quantity;
    });
    print(_cartitems);
    return totalprice;
  }
  void deleteitem(prodID){
    _cartitems.remove(prodID);
    notifyListeners();

  }
  void clearcart()
  {
    _cartitems={};
    notifyListeners();
  }


}
