import 'package:flutter/material.dart';
import 'package:aqp_dev/dogbone.dart';

class EnterDogbonesPage extends StatefulWidget {
  @override
  _EnterDogbonesPageState createState() => _EnterDogbonesPageState();
}

class _EnterDogbonesPageState extends State<EnterDogbonesPage> {
  List<DogboneData> dogbonesData = []; // List to store data for each dog bone

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
                  // Handle submit logic
                  // You can access the data for each dog bone in the dogbonesData list
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
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController thicknessController = TextEditingController();
  TextEditingController fileController = TextEditingController();

  DogboneData({required this.numberController});
}
