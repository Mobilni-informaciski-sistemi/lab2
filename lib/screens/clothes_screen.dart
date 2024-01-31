import 'package:flutter/material.dart';
import 'package:lab2/widgets/new_cloth.dart';

import '../model/Cloth.dart';
import '../widgets/edit_cloth.dart';

class ClothesListScreen extends StatefulWidget {
  const ClothesListScreen({super.key});

  @override
  State<ClothesListScreen> createState() => _ClothesListScreenState();
}

class _ClothesListScreenState extends State<ClothesListScreen> {
  List<Cloth> _clothes = [];

  void _addNewClothToList(Cloth cloth) {
    setState(() {
      _clothes.add(cloth);
    });
  }

  void _addClothFunction() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewCloth(
              addCloth: _addNewClothToList,
            ),
          );
        });
  }

  void _editSpecificCloth(int id, String name, String desc) {
    setState(() {
      if (desc.isNotEmpty || name.isNotEmpty) {
        for (int i = 0; i < _clothes.length; i++) {
          if (_clothes[i].id == id) {
            _clothes[i].description = desc;
            _clothes[i].name = name;
            return;
          }
        }
      }
    });
  }

  void _editClothFunction(int id) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: EditCloth(
              id: id,
              editCloth: _editSpecificCloth,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clothing List - 201505"),
        backgroundColor: Theme.of(context).colorScheme.error,
        actions: [
          IconButton(
              onPressed: () => _addClothFunction(),
              icon: const Icon(
                Icons.add_circle_rounded,
                color: Colors.green,
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: _clothes.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.redAccent,
              child: ListTile(
                  title: Text(
                    _clothes[index].name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.lightBlueAccent),
                  ),
                  subtitle: Text(
                    _clothes[index].description,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete_rounded,
                            color: Colors.greenAccent),
                        onPressed: () {
                          setState(() {
                            _clothes.removeAt(index);
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.greenAccent),
                        onPressed: () {
                          _editClothFunction(_clothes[index].id);
                        },
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
