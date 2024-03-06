import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/src/file_picker.dart';
import 'package:aqp_dev/dogbones/dogbone.dart';

class DogboneWidget extends StatefulWidget {
  final Dogbone dogbone;

  DogboneWidget({required this.dogbone});

  @override
  _DogboneState createState() => _DogboneState();
}

class _DogboneState extends State<DogboneWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
                  controller: widget.dogbone.number,
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
                  controller: widget.dogbone.note,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Notes',
                    labelText: 'Notes',
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
                  controller: widget.dogbone.length,
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
                  controller: widget.dogbone.width,
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
                  controller: widget.dogbone.thickness,
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
                  controller: widget.dogbone.fileName,
                  onTap: () async {
                    var picked =
                        await FilePicker.platform.pickFiles(type: FileType.any);

                    if (picked != null) {
                      widget.dogbone.fileName.text = picked.files.first.name;
                      widget.dogbone.fileData = picked.files.first.bytes!;
                      widget.dogbone.timeStamp = DateTime.now().toString();
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
