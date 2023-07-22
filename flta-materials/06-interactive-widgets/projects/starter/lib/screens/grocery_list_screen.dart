import 'package:flutter/material.dart';
import '../components/grocery_tile.dart';
import '../models/gocery_manager.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;

  const GroceryListScreen({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            final item = groceryItems[index];
            //TODO: wrap in a Dsimissable
            //TODO: wrap in a inkwell

            return GroceryTile(
              key: Key(item.id),
              item: item,
              onComplete: (change) {
                if (change != null) {
                  manager.comleteItem(index, change);
                }
              },
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16.0);
          },
          itemCount: groceryItems.length),
    );
  }
}
