import 'package:favoriteapp1_state_management/FavoriteApp_Example/favorite_provider/FavoriteProvider.dart';
import 'package:favoriteapp1_state_management/FavoriteApp_Example/favorite_screen/MyFavorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavorite()));
              },
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
              )),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavoriteProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
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
