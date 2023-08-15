import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

// import 'package:meals_app/screens/TabsScreen.dart';
// import 'package:meals_app/widgets/SideBar.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(title: Text("My filters")),
      body: Column(
        children: [
          SwitchListTile(
            value: activefilters[Filters.glutin]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.glutin, value);
            },
            title: Text("Glutin-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            subtitle: Text("Only includes gluten-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    )),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilters[Filters.lactose]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.lactose, value);
            },
            title: Text("Lactose-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            subtitle: Text("Only includes lactose-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    )),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilters[Filters.vegeterian]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.vegeterian, value);
            },
            title: Text("Vegeterain",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            subtitle: Text("Only includes vegeterain meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    )),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilters[Filters.vegan]!,
            onChanged: (value) {
              ref.read(filterProvider.notifier).setFilter(Filters.vegan, value);
            },
            title: Text("Vegan meals",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            subtitle: Text("Only includes vegan meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    )),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          )
        ],
      ),
    );
  }
}
