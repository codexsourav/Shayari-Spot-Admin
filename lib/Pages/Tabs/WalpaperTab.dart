import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mysyriadmin/constents.dart';
import 'package:mysyriadmin/res/ImgBox.dart';

class WalpaperTab extends StatelessWidget {
  const WalpaperTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('images').doc('walpaper').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: snapshot.data!.data()!['imgList']!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) {
                var data = snapshot.data!.data()!['imgList'];
              

                return imgBox(context: context, url: data[index], index: index);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: whitecolor,
              ),
            );
          }
        });
  }
}
