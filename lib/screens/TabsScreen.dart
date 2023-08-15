import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favouritemeal_provider.dart';
import 'package:meals_app/screens/CategoriesWidget.dart';
import 'package:meals_app/screens/FiltersScreen.dart';
import 'package:meals_app/screens/MealScreen.dart';
import 'package:meals_app/widgets/SideBar.dart';
import 'package:meals_app/providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedIndex = 0;
  String selectedtitle = 'Category';
  void selectedScreen(int indexing) {
    setState(() {
      selectedIndex = indexing;
    });
  }

  void showscreenfunction(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "Filter") {
      await Navigator.of(context).push<Map<Filters, bool>>(MaterialPageRoute(
        builder: (context) => const FiltersScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealProvider);
    Widget currentScreen = CategoriesScreen(
      availableMeals: availableMeals,
    );
    selectedtitle = 'Category';
    if (selectedIndex == 1) {
      final mealFavourite = ref.watch(favouritemeals);
      currentScreen = MealsScreen(
        meal: mealFavourite,
      );
      selectedtitle = 'Favourites';
    }

    return Scaffold(
      drawer: MainDrawer(onshowScreen: showscreenfunction),
      appBar: AppBar(title: Text(selectedtitle)),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectedScreen,
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.adjust_sharp), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.stars), label: 'Favourite'),
          ]),
    );
  }
}
