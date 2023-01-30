import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Instance {
  final CollectionReference firestore = FirebaseFirestore.instance.collection('shayri');
  final CollectionReference firestoreimg = FirebaseFirestore.instance.collection('images');
  final fbstorage = FirebaseStorage.instance;
}
