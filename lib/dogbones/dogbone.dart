import 'package:flutter/material.dart';
import 'package:file_picker/src/file_picker.dart';

class Dogbone extends StatelessWidget {
  final TextEditingController numberController;
  final TextEditingController lengthController;
  final TextEditingController widthController;
  final TextEditingController thicknessController;
  final TextEditingController fileController;
  final Color cardColor;

  Dogbone({
    required this.numberController,
    required this.lengthController,
    required this.widthController,
    required this.thicknessController,
    required this.fileController,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextField(
                  controller: numberController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter number',
                    labelText: 'Dogbone: ',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextField(
                  controller: lengthController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter length',
                    labelText: 'length [mm]',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextField(
                  controller: widthController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter width',
                    labelText: 'width [mm]',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextField(
                  controller: thicknessController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter thickness',
                    labelText: 'thickness [mm]',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextField(
                  enabled: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Force [N]',
                    labelText: 'Force [N]',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextField(
                  enabled: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Elongation [%]',
                    hintText: 'Elongation [%]',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextField(
                  controller: fileController,
                  onTap: () async {
                    var picked =
                        await FilePicker.platform.pickFiles(type: FileType.any);

                    if (picked != null) {
                      print(picked.files.first.name);
                      fileController.text = picked.files.first.name;
                    }
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Dogbone file',
                    hintText: 'Dogbone file',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
