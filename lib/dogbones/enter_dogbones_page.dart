import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:aqp_dev/dogbones/dogbone_widget.dart';
import 'package:aqp_dev/dogbones/dogbone.dart';

class EnterDogbonesPage extends StatefulWidget {
  @override
  _EnterDogbonesPageState createState() => _EnterDogbonesPageState();
}

class _EnterDogbonesPageState extends State<EnterDogbonesPage> {
  List<DogboneWidget> dogboneWidgets = [];

  Future<void> createDogbone(Dogbone dogbone) async {
    const String apiUrl = 'http://aqp:8080/dogbones/';

    try {
      final uri = Uri.parse(apiUrl);
      var request = http.MultipartRequest('POST', uri);
      // Add JSON data to the request
      request.fields['timestamp'] = dogbone.timeStamp;
      request.fields['number'] = dogbone.number.text;
      request.fields['note'] = dogbone.note.text;
      request.fields['length'] = dogbone.length.text;
      request.fields['width'] = dogbone.width.text;
      request.fields['thickness'] = dogbone.thickness.text;
      request.fields['file_name'] = dogbone.fileName.text;
      request.fields['file_data'] = dogbone.fileData;

      print("Body: ${request.fields}");
      final response = await request.send();

      if (response.statusCode == 200) {
        print("Dogbone created successfully");
      } else {
        print("Error creating dogbone. Status code: ${response.statusCode}");
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
                  // Add a new dog bone widget
                  setState(() {
                    dogboneWidgets.add(DogboneWidget(
                      dogbone: Dogbone(
                        number: (dogboneWidgets.length + 1).toString(),
                      ),
                    ));
                  });
                },
                child: Text('Add Dog Bone'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Remove the last dog bone widget
                  if (dogboneWidgets.isNotEmpty) {
                    setState(() {
                      dogboneWidgets.removeLast();
                    });
                  }
                },
                child: Text('Remove Last Dog Bone'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Submit the first dog bone widget
                  if (dogboneWidgets.isNotEmpty) {
                    createDogbone(dogboneWidgets[0].dogbone);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dogboneWidgets.length,
              itemBuilder: (context, index) {
                return DogboneWidget(
                  dogbone: dogboneWidgets[index].dogbone,
                  cardColor: index.isEven
                      ? Colors.grey.shade300
                      : Colors.grey.shade400,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
