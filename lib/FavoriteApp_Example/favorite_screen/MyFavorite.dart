import 'package:favoriteapp1_state_management/FavoriteApp_Example/favorite_provider/FavoriteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFavorite extends StatefulWidget {
  const MyFavorite({super.key});

  @override
  State<MyFavorite> createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<FavoriteProvider>(context);
    print("scaffplf");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: provider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavoriteProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          }
                        },
                        title: Text("Items ${index}"),
                        trailing: value.selectedItem.contains(index)
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_outline),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
