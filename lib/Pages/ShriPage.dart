import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mysyriadmin/Models/db/fbFunc.dart';
import 'package:mysyriadmin/constents.dart';
import 'package:mysyriadmin/res/ShriAddBox.dart';
import 'package:mysyriadmin/res/ShriBox.dart';
import 'package:mysyriadmin/res/Update/UpdateShri.dart';

class ShriPage extends StatefulWidget {
  final id;
  final catename;
  final lable;

  const ShriPage({super.key, required this.id, required this.catename, required this.lable});
  @override
  State<ShriPage> createState() => _ShriPageState(id: id, catename: catename, lable: this.lable);
}

class _ShriPageState extends State<ShriPage> {
  final id;
  final catename;

  final lable;

  _ShriPageState({required this.id, required this.catename, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: bgcolor,
          leading: IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            lable.toString(),
            style: const TextStyle(color: textcolor, fontSize: 16, fontWeight: FontWeight.w400),
          )),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('shayri').doc(id).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.only(bottom: 60),
                itemCount: snapshot.data!.data()!['content']!.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.data()!['content'];
              

                  return ShriBox(
                      TextData: Text(
                        data[index],
                        style: const TextStyle(color: textcolor),
                      ),
                      onpressUpdate: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return UpdateShri(id: id, index: index, text: data[index]);
                          },
                        );
                      },
                      onpressDelete: () async {
                        await FbFunc().deleteShri(id, index);
                      });
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: whitecolor,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: sndbg,
        elevation: 0.0,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ShriAddBox(
                id: id,
              );
            },
          );
        },
        extendedPadding: const EdgeInsets.all(20),
        label: const Text('Add Shayari'),
        icon: const Icon(Icons.monitor_heart_rounded),
      ),
    );
  }
}
