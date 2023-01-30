import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mysyriadmin/Models/db/fbFunc.dart';

import 'package:mysyriadmin/Models/db/instance.dart';

String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

handelupload() async {
  try {
    var allowExt = ['jpg', 'png', 'jpeg', 'gif'];
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowExt,
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      var pickpath = File(file.path.toString());
      var pathFilename = "images/${getRandString(10) + file.name}";
      var pickext = file.extension;
      if (!allowExt.contains(pickext)) {
        return {"error": true};
      }
      final fireStoreage = Instance().fbstorage.ref().child(pathFilename);
      var uploadTask = fireStoreage.putFile(pickpath);
      final fileInfo = await uploadTask.whenComplete(() {});
      final link = await fileInfo.ref.getDownloadURL();

      await FbFunc().addImages(link);

      return {"url": link};
    } else {
      return {"error": true};
    }
  } catch (e) {
    return {"error": true};
  }
}
