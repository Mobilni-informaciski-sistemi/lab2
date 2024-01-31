import 'package:flutter/material.dart';

class EditCloth extends StatefulWidget {
  final Function editCloth;
  final int id;

  const EditCloth({super.key, required this.editCloth, required this.id});

  @override
  State<EditCloth> createState() => _EditClothState();
}

class _EditClothState extends State<EditCloth> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitData() {
    final inputName = _nameController.text;
    final inputDesc = _descriptionController.text;
    if (inputDesc.isEmpty || inputName.isEmpty) return;

    widget.editCloth(widget.id, inputName, inputDesc);

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
