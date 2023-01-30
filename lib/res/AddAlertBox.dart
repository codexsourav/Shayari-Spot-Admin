import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mysyriadmin/Models/db/fbFunc.dart';
import 'package:mysyriadmin/constents.dart';
import 'package:mysyriadmin/res/Snackbar.dart';

class AddAlertBox extends StatefulWidget {
  const AddAlertBox({super.key});

  @override
  State<AddAlertBox> createState() => _AddAlertBoxState();
}

class _AddAlertBoxState extends State<AddAlertBox> {
  bool loading = false;
  TextEditingController lablename = TextEditingController();
  var fbFunc = FbFunc();
  addlable() async {
    if (lablename.text.isNotEmpty) {
      setState(() {
        loading = true;
      });
      DocumentSnapshot<Object?> data = await fbFunc.addNewCat(lablename.text);
      setState(() {
        loading = false;
      });
      if (data.data() != null) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(MySnackBar());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0.0,
      backgroundColor: sndbg,
      title: const Text(
        "Add New Category",
        style: TextStyle(color: textcolor, fontWeight: FontWeight.w400),
      ),
      content: Container(
        decoration: BoxDecoration(color: inpcolor, borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: TextField(
          controller: lablename,
          decoration: const InputDecoration(
            hintText: "Category Name",
            border: InputBorder.none,
          ),
        ),
      ),
      actions: [
        !loading
            ? TextButton(
                onPressed: addlable,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Add Now",
                    style: TextStyle(color: textcolor),
                  ),
                ),
              )
            : Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.all(10),
                child: const CircularProgressIndicator(
                  color: whitecolor,
                  strokeWidth: 3,
                ),
              )
      ],
    );
  }
}
