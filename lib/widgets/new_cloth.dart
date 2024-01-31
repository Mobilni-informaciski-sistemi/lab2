import 'dart:math';

import 'package:flutter/material.dart';

import '../model/Cloth.dart';

class NewCloth extends StatefulWidget {
  final Function addCloth;

  const NewCloth({super.key, required this.addCloth});

  @override
  State<NewCloth> createState() => _NewClothState();
}

class _NewClothState extends State<NewCloth> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitData() {
    final inputName = _nameController.text;
    final inputDesc = _descriptionController.text;
    if (inputDesc.isEmpty || inputName.isEmpty) return;

    final cloth = Cloth(Random().nextInt(30), inputName, inputDesc);

    widget.addCloth(cloth);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: "Name:"),
            onSubmitted: (_) => _submitData,
          ),
          TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: "Description:"),
              onSubmitted: (_) => _submitData),
          ElevatedButton(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            onPressed: _submitData,
            child: Text("Submit!"),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[100],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
