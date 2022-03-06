import 'package:get/get.dart';
import '../data/repository/recommended_food_repo.dart';
import '../models/products_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  final data = {
    "total_size": 8,
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
        "id": 6,
        "name": "Pre-Roll Regular Size(2)",
        "description":
        "The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.",
        "price": 15,
        "stars": 4,
        "img": "h3.png",
        "location": "china",
        "created_at": "2021-12-23 15:03:24",
        "updated_at": "2022-01-21 10:28:04",
        "type_id": 3
      },
      {
        "id": 7,
        "name": "Pre-Roll King Size(2)",
        "description":
        "The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.",
        "price": 25,
        "stars": 5,
        "img": "h4.png",
        "location": "Cuba",
        "created_at": "2021-12-23 15:04:49",
        "updated_at": "2022-01-01 08:56:45",
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
        "id": 12,
        "name": "Infused Vegan Cookies",
        "description":
        "Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.",
        "price": 20,
        "stars": 5,
        "img": "h7.png",
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


  RecommendedProductController ({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];

  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      print("got products recommended ");
      _recommendedProductList = [];
      //_recommendedProductList  .addAll(Product.fromJson(response.body).products);
      _recommendedProductList  .addAll(Product.fromJson(data).products);

      _isLoaded = true;

      update();
    } else {
      print("could not ge t products recommended ");
    }
  }
}
