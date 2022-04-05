import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  final data = {
    "total_size": 5,
    "type_id": 2,
    "offset": 0,
    "products": [
      {
        "id": 1,
        "name": "Flower(Hybrid)",
        "description":
            "This five red bases, two are dedicated to salami (fennel and regular), and there s a classic capricciosa or beef carpaccio. Blanco options include a mushroom, and a four-cheese extravaganza featuring great lobes of a tangy fior di latte they make in house every day (more on this later). Classic, precise, good.I think it s still better to think of this venue not as a pizzeria, but as Pizza, by Di Stasio.Rinaldo Di Stasio and Mallory Wall s empire, including the original restaurant and bar in St Kilda, Citta and now Carlton, is a designer label for dining.",
        "price": 30,
        "stars": 4,
        "img": "h1.png",
        "location": "Canada, British Columbia",
        "created_at": "2021-11-17 10:09:08",
        "updated_at": "2022-01-01 08:27:22",
        "type_id": 3
      },
      {
        "id": 2,
        "name": "Pre-Roll Regular Size(2)",
        "description":
            "The best sweet dessertThe quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.",
        "price": 15,
        "stars": 5,
        "img": "h2.png",
        "location": "Icefields, Alberta",
        "created_at": "2021-11-17 10:10:43",
        "updated_at": "2022-01-01 08:54:42",
        "type_id": 3
      },
      {
        "id": 10,
        "name": "Infused Vegan Cookie & Brownie",
        "description":
            "Baking sweet treats is serious business around the holidays. The oven is basically a revolving door with trays of stacked cookies flying in and out. We ain’t complaining. And whether you’re a purist with a family recipe that still shines or a new baker looking for something bold to whip up, there’s a special batch you may want to consider. Yep, we’re talking cannabis cookies.",
        "price": 20,
        "stars": 4,
        "img": "h5.png",
        "location": "china",
        "created_at": "2021-12-27 06:29:47",
        "updated_at": "2022-01-01 08:56:33",
        "type_id": 3
      },
      {
        "id": 11,
        "name": "Infused Vegan Brownies",
        "description":
            "Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.",
        "price": 20,
        "stars": 5,
        "img": "h6.png",
        "location": "china",
        "created_at": "2021-12-27 06:35:34",
        "updated_at": "2022-01-01 08:56:22",
        "type_id": 3
      },
      {
        "id": 13,
        "name": "Vape Cartridge",
        "description":
            "Vaporizers are the perfect solution for those looking for a convenient, discreet, and effective way to enjoy cannabis. More commonly known as ‘vape pens,’ vaporizers are a healthier alternative to traditional smoking methods and have been met with increasing popularity. Vaping is a unique process that involves transforming a liquid into a vapor. A vape contains a cannabis cartridges that is loaded with concentrate. Once the cartridge is depleted, it will either need to be refilled or disposed of, depending on the type of vape pen you own.",
        "price": 35,
        "stars": 3,
        "img": "h8.png",
        "location": "china",
        "created_at": "2021-12-27 06:35:34",
        "updated_at": "2022-01-01 08:56:22",
        "type_id": 3
      }
    ]
  };

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  int _quantity = 0;

  int get quantity => _quantity;

  int _inCartItems=0;
  int get inCartItems => _inCartItems +_quantity;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("got products");
      _popularProductList = [];
      //_popularProductList.addAll(Product.fromJson(response.body).products);
      _popularProductList.addAll(Product.fromJson(data).products);

      _isLoaded = true;

      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      print("number of items" + _quantity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (_inCartItems + quantity < 0) {
      Get.snackbar("Item count", "You can not reduce more!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if(_inCartItems>0){
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if (_inCartItems + quantity > 20) {
      Get.snackbar("Item count", "You can not add more!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exists=false;
    exists= _cart.existsInCart(product);

    if(exists) {
      _inCartItems=_cart.getQuantity(product);

    }
    print("quantity in cart is " +  _inCartItems.toString());

    //if exists
    // get from storage _inCartItems
  }

  void addItem(ProductModel product){
      _cart.addItem(product, quantity);
      _quantity = 0;
      _inCartItems=_cart.getQuantity(product);
      _cart.items.forEach((key, value) {
       });

      _cart.items.forEach((key, value) {print("id is " + value.id.toString() + "qnd quantity is " + value.quantity.toString());});

      update();//This updates the ui
  }

  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }
}
