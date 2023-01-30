import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mysyriadmin/Models/db/instance.dart';
import 'package:mysyriadmin/constents.dart';
import 'package:mysyriadmin/res/CatBox.dart';
import 'package:mysyriadmin/res/Update/UpdateCate.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Instance().firestore.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 80),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];
                ///////////////////////////////////
                //////////////////////////////////
                return Dismissible(
                  direction: DismissDirection.startToEnd,
                  resizeDuration: const Duration(milliseconds: 200),
                  key: UniqueKey(),
                  background: Container(
                    height: 64,
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    alignment: AlignmentDirectional.centerStart,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                  ),
                  onDismissed: ((direction) {
                    Instance().firestore.doc(doc.id).delete();
                  }),
                  child: CatBox(
                    context: context,
                    id: doc.id,
                    lable: doc['name'],
                    text: Text(
                      doc['name'].toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: textcolor,
                      ),
                    ),
                    onclickUpdate: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return UpdateCate(getData: {"name": doc['name'], "id": doc.id});
                        },
                      );
                    },
                  ),
                );
                ////////////////////////////////
                //////////////////
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: whitecolor,
            ),
          );
        }
      },
    );
  }
}
