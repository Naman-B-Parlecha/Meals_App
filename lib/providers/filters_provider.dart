import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filters { glutin, lactose, vegeterian, vegan }

class FilterNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterNotifier()
      : super({
          Filters.glutin: false,
          Filters.lactose: false,
          Filters.vegeterian: false,
          Filters.vegan: false
        });
  void setFilters(Map<Filters, bool> filterlist) {
    state = filterlist;
  }

  void setFilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<Filters, bool>>(
        (ref) => FilterNotifier());

final filteredMealProvider = Provider((ref) {
  final meals = ref.watch(mealProvide);
  final onSelectFilter = ref.watch(filterProvider);
  return meals.where((meal) {
    if (onSelectFilter[Filters.glutin]! && !meal.isGlutenFree) {
      return false;
    }
    if (onSelectFilter[Filters.lactose]! && !meal.isLactoseFree) {
      return false;
    }
    if (onSelectFilter[Filters.vegeterian]! && !meal.isVegetarian) {
      return false;
    }
    if (onSelectFilter[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
