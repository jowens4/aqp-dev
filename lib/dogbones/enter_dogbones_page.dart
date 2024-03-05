import 'package:flutter/material.dart';
import 'package:aqp_dev/dogbones/dogbone.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EnterDogbonesPage extends StatefulWidget {
  @override
  _EnterDogbonesPageState createState() => _EnterDogbonesPageState();
}

class _EnterDogbonesPageState extends State<EnterDogbonesPage> {
  List<DogboneData> dogbonesData = []; // List to store data for each dog bone

  Future<void> createDogbone(
    String id,
    String timestamp,
    String number,
    String note,
    String length,
    String width,
    String thickness,
    String file,
  ) async {
    const String apiUrl = 'http://aqp:8080/dogbone/';

    Map<String, String> requestBody = {
      "id": id,
      "timestamp": timestamp,
      "number": number,
      "note": note,
      "length": length,
      "width": width,
      "thickness": thickness,
      "files": file,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        print("User created successfully");
      } else {
        print("Error creating user. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("Error during POST request: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "ENTER DOGBONES PAGE",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add a new dog bone
                  setState(() {
                    dogbonesData.add(DogboneData(
                      numberController: TextEditingController(
                        text: (dogbonesData.length + 1).toString(),
                      ),
                    ));
                  });
                },
                child: Text('Add Dog Bone'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Remove the last dog bone
                  if (dogbonesData.isNotEmpty) {
                    setState(() {
                      dogbonesData.removeLast();
                    });
                  }
                },
                child: Text('Remove Last Dog Bone'),
              ),
              ElevatedButton(
                onPressed: () {
                  createDogbone(
                      dogbonesData[0].numberController.text,
                      dogbonesData[0].numberController.text,
                      dogbonesData[0].numberController.text,
                      dogbonesData[0].noteController.text,
                      dogbonesData[0].lengthController.text,
                      dogbonesData[0].widthController.text,
                      dogbonesData[0].thicknessController.text,
                      dogbonesData[0].fileController.text);
                },
                child: Text('Submit'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dogbonesData.length,
              itemBuilder: (context, index) {
                return Dogbone(
                    numberController: dogbonesData[index].numberController,
                    noteController: dogbonesData[index].noteController,
                    lengthController: dogbonesData[index].lengthController,
                    widthController: dogbonesData[index].widthController,
                    thicknessController:
                        dogbonesData[index].thicknessController,
                    fileController: dogbonesData[index].fileController,
                    cardColor: index.isEven
                        ? Colors.grey.shade300
                        : Colors.grey.shade400);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DogboneData {
  TextEditingController numberController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController thicknessController = TextEditingController();
  TextEditingController fileController = TextEditingController();

  DogboneData({required this.numberController});
}
