import 'package:flutter/material.dart';
import 'package:meals_app/model/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favouritemeal_provider.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouritemeal = ref.watch(favouritemeals);
    final Existing = favouritemeal.contains(meal);
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
              onPressed: () {
                final status =
                    ref.read(favouritemeals.notifier).toggleFavourite(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(status ? "Meal added" : "Meal removed")));
              },
              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween(begin: 0.5, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                child: Icon(Existing ? Icons.star : Icons.star_border,
                    key: ValueKey(Existing)),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                Hero(
                  tag: meal.id,
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                    height: 300,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                for (final ingredients in meal.ingredients)
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      ingredients,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                SizedBox(height: 14),
                Text(
                  "Steps",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                for (final steps in meal.steps)
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      steps,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  )
              ],
            ),
          ),
        ));
  }
}
