import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mysyriadmin/Models/db/instance.dart';
import 'dart:core';

class FbFunc extends Instance {
  addNewCat(String name) async {
    try {
      var getdata = await firestore.add({"name": name, "content": []});
      return await getdata.get();
    } catch (e) {
      print({"error": e});
      return false;
    }
  }

  updateCat(String name, String id) async {
    try {
      await firestore.doc(id).update({"name": name});
      return true;
    } catch (e) {
      print({"error": e});
      return false;
    }
  }

  getOneShri(id) async {
    DocumentSnapshot dataInfo = await firestore.doc(id).get();
    return dataInfo.data();
  }

  addShri(id, text) async {
    try {
      var data = await getOneShri(id);
      await firestore.doc(id).update({
        "content": [...data['content'], text]
      });
      return true;
    } catch (e) {
      print({"error": e});
      return false;
    }
  }

  deleteShri(id, int index) async {
    try {
      var data = await getOneShri(id);
      data = data['content'];
      data.removeAt(index);

      await firestore.doc(id).update({"content": data});
      return true;
    } catch (e) {
      print({"error": e});
      return false;
    }
  }

  updateShri(id, int index, String text) async {
    try {
      var data = await getOneShri(id);
      var updatedata = data['content'];
      updatedata[index] = text;
      await firestore.doc(id).update({"content": updatedata});
      return true;
    } catch (e) {
      print({"error": e});
      return false;
    }
  }

  getImages() async {
    DocumentSnapshot imgDbData = await Instance().firestoreimg.doc('walpaper').get();
    return imgDbData.data();
  }

  addImages(String link) async {
    try {
      var imgdata = await getImages();
      if (imgdata == null) {
        await Instance().firestoreimg.doc('walpaper').set({
          "imgList": [link]
        });
      } else {
        await Instance().firestoreimg.doc('walpaper').set({
          "imgList": [...imgdata['imgList'], link]
        });
      }
    } catch (e) {
      print(e);
    }
  }

  deleteImg(int index, String url) async {
    try {
      var data = await getImages();
      data = data['imgList'];
      data.removeAt(index);
      await firestoreimg.doc('walpaper').set({"imgList": data});

      var getref = fbstorage.refFromURL(url).fullPath;
      await fbstorage.ref().child(getref).delete();

      return true;
    } catch (e) {
      print({"error": e});
      return false;
    }
  }
}
