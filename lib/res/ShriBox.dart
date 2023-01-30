import 'package:flutter/material.dart';
import 'package:mysyriadmin/constents.dart';

Widget ShriBox({required Widget TextData, onpressDelete = null, onpressUpdate = null}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    decoration: BoxDecoration(color: boxcolor, borderRadius: BorderRadius.circular(20)),
    width: double.infinity,
    child: Column(children: [
      Center(
        child: TextData,
      ),
      const SizedBox(height: 25),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: onpressUpdate,
              icon: const Icon(
                Icons.edit,
                size: 20,
                color: iconcolor,
              )),
          IconButton(
            onPressed: onpressDelete,
            icon: const Icon(Icons.delete_rounded, size: 20, color: iconcolor),
          )
        ],
      )
    ]),
  );
}
