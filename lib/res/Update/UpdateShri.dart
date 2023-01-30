import 'package:flutter/material.dart';
import 'package:mysyriadmin/Models/db/fbFunc.dart';
import 'package:mysyriadmin/constents.dart';

class UpdateShri extends StatefulWidget {
  final id;
  final index;
  final text;

  const UpdateShri({super.key, required this.id, required this.index, required this.text});

  @override
  State<UpdateShri> createState() => _UpdateShriState(id: this.id, index: this.index, text: this.text);
}

class _UpdateShriState extends State<UpdateShri> {
  final id;
  final index;
  final text;

  _UpdateShriState({required this.id, required this.index, required this.text});

  TextEditingController shriinp = TextEditingController();
  bool loading = false;
  void initState() {
    super.initState();
    shriinp.text = text;
  }

  updateShricall() async {
    if (shriinp.text.isNotEmpty) {
      setState(() {
        loading = true;
      });
      var data = await FbFunc().updateShri(id, index, shriinp.text);
      setState(() {
        loading = false;
      });
      if (data) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0.0,
      contentPadding: const EdgeInsets.all(8),
      backgroundColor: sndbg,
      title: const Text(
        "Add New Shayari",
        style: TextStyle(color: textcolor, fontWeight: FontWeight.w400),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: inpcolor, borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: TextField(
          controller: shriinp,
          maxLines: 10,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: updateShricall,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: !loading
                ? const Text(
                    "Update Now",
                    style: TextStyle(color: textcolor),
                  )
                : const SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      color: whitecolor,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
