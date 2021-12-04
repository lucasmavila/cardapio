import 'package:cardap/shared/data/cities.dart';
import 'package:cardap/shared/models/foodcamp/food_camp_store_model.dart';
import 'package:cardap/shared/models/store_model.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_images.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:cardap/shared/themes/responsive_padding.dart';
import 'package:cardap/shared/widgets/confirm_button/confirm_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class StoreController extends ChangeNotifier {
  StoreModel store = StoreModel();
  FoodCampStoreModel foodCampStore = FoodCampStoreModel();

  StoreController(BuildContext context) {
    loadFromApiUrl(context);
  }

  Future<void> loadFromLocalDataSet(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    store = StoreModel.fromMap(storesDataSet[0]);
    notifyListeners();
    Navigator.pushNamed(context, "/home");
  }

  Future<void> loadFromApiUrl(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    var url = Uri.parse('https://food-camp-cardapio.herokuapp.com/exemplo01');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      foodCampStore = FoodCampStoreModel.fromJson(response.body);
      notifyListeners();
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Erro"),
                content: Text("Falha ao tentar conectar com o servidor :/"),
              ));
    }
  }

  Widget getSplashWidget(BuildContext context) {
    if (foodCampStore.restaurantImg == null) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: AppColors.primary),
        ],
      ));
    } else {
      return (Padding(
        padding: ResponsivePadding().getPadding(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(getStoreLogo()),
              Text("Bem vindo!", style: AppTextStyles.mediumTitle),
              ConfirmButtonWidget(
                  label: "Iniciar",
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                  readyToPress: true)
            ],
          ),
        ),
      ));
    }
  }

  String getStoreLogo() {
    return foodCampStore.restaurantImg ??
        "https://www.google.com.br/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png";
  }

  String getStoreName() {
    return foodCampStore.restaurantName ?? "";
  }

  String getStoreSubtitle() {
    return foodCampStore.restaurantWppNumber ?? "";
  }

  bool isThereMenuStore() {
    return foodCampStore.categories == null;
  }

  int getMenuCategoriesLenght() {
    return foodCampStore.categories?.length ?? 0;
  }

  String getCategoryName(int categoryIndex) {
    return foodCampStore.categories?[categoryIndex].categorieName ?? "";
  }

  int getMenuCategoryItemsLenght(int categoryIndex) {
    return foodCampStore.categories?[categoryIndex].categorieItens.length ?? 0;
  }

  String getItemName(int categoryIndex, int itemIndex) {
    return foodCampStore
            .categories?[categoryIndex].categorieItens[itemIndex].productName ??
        "";
  }

  String getItemPrice(int categoryIndex, int itemIndex) {
    return foodCampStore.categories?[categoryIndex].categorieItens[itemIndex]
            .productPrice ??
        "";
  }

  String getItemDescription(int categoryIndex, int itemIndex) {
    return foodCampStore.categories?[categoryIndex].categorieItens[itemIndex]
            .productDescription ??
        "";
  }

  String getItemImage(int categoryIndex, int itemIndex) {
    return foodCampStore
            .categories?[categoryIndex].categorieItens[itemIndex].productImg ??
        "";
  }
}
