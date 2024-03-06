import 'package:flutter/material.dart';

class Dogbone {
  String timeStamp = '';
  TextEditingController number = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController length = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController thickness = TextEditingController();
  TextEditingController fileName = TextEditingController();
  String fileData = '';

  Dogbone({
    required String number,
  }) : number = TextEditingController(text: number);
}
