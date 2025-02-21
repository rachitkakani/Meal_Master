import 'package:flutter/material.dart';

import 'package:meals_extended/data/dummy_data.dart';
import 'package:meals_extended/models/meal.dart';
import 'package:meals_extended/widgets/category_grid_item.dart';
import 'package:meals_extended/screens/meals.dart';
import 'package:meals_extended/models/category.dart';

//***Mine is Shit***//
// class CategoriesScreen extends StatefulWidget {
//   const CategoriesScreen({
//     super.key,
//     required this.availableMeals,
//   });

//   final List<Meal> availableMeals;

//   @override
//   State<CategoriesScreen> createState() => _CategoriesScreenState();
// }

// class _CategoriesScreenState extends State<CategoriesScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   //AnimationController is a class provided by flutter
//   // late tells that value will be in future but prior enough before its use

//   @override
//   void initState() {
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//       lowerBound: 0, // 0 and 1 are default bounds
//       upperBound: 1,
//     );
//     super.initState();
//   }

//   // @override
//   // void dispose() {
//   //   _animationController.dispose();
//   //   super.dispose();
//   // }

//   void _selectCategory(BuildContext context, Category category) {
//     final filteredMeals = widget.availableMeals
//         .where((meal) => meal.categories.contains(category.id))
//         .toList();

//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (ctx) => MealsScreen(
//           title: category.title,
//           meals: filteredMeals,
//         ),
//       ),
//     ); // Navigator.push(context, route)
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animationController,
//       builder: (context, child) => SlideTransition(
//         position: Tween(
//           //Tween()-animating between two values
//           begin: const Offset(0, 0.3),
//           end: const Offset(0, 0),
//         ).animate(
//           CurvedAnimation(
//             parent: _animationController,
//             curve: Curves.easeInOut,
//           ),
//         ),
//         child: child,
//       ),
//       child: GridView(
//         padding: const EdgeInsets.all(24),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 3 / 2,
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 20,
//         ),
//         children: [
//           // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
//           for (final category in availableCategories)
//             CategoryGridItem(
//               category: category,
//               onSelectCategory: () {
//                 _selectCategory(context, category);
//               },
//             ),
//         ],
//       ),
//     );
//   }
// }


//***This is good***/

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      ),
    );
  }
}