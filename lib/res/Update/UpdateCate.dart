import 'package:flutter/material.dart';
import 'package:mysyriadmin/Models/db/fbFunc.dart';
import 'package:mysyriadmin/constents.dart';
import 'package:mysyriadmin/res/Snackbar.dart';

class UpdateCate extends StatefulWidget {
  final getData;
  const UpdateCate({
    super.key,
    required this.getData,
  });

  @override
  State<UpdateCate> createState() => _UpdateCateState(getData: this.getData);
}

class _UpdateCateState extends State<UpdateCate> {
  late var getData;
  late var lablename;

  _UpdateCateState({
    required this.getData,
  });

  @override
  void initState() {
    super.initState();
    String name = this.getData['name'];
    lablename = TextEditingController(text: name.toString());
  }

  bool loading = false;

  var fbFunc = FbFunc();

  @override
  Widget build(BuildContext context) {
    updatelable() async {
      if (lablename.text.length != 0) {
        setState(() {
          loading = true;
        });
        var data = await fbFunc.updateCat(lablename.text, getData['id']);
        setState(() {
          loading = false;
        });
        if (data != false) {
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(MySnackBar());
        }
      }
    }

    return AlertDialog(
      elevation: 0.0,
      backgroundColor: sndbg,
      title: const Text(
        "Update Category",
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Update Now",
                    style: TextStyle(color: textcolor),
                  ),
                ),
                onPressed: updatelable,
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
