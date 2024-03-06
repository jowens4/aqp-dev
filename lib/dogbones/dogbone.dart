import 'package:flutter/material.dart';
import 'dart:typed_data';

class Dogbone {
  String timeStamp = '';
  TextEditingController number = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController length = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController thickness = TextEditingController();
  TextEditingController fileName = TextEditingController();
  Uint8List fileData = Uint8List(0);

  Dogbone({
    required String number,
  }) : number = TextEditingController(text: number);
}
