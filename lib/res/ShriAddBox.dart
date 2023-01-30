import 'package:flutter/material.dart';
import 'package:mysyriadmin/Models/db/fbFunc.dart';
import 'package:mysyriadmin/constents.dart';

class ShriAddBox extends StatefulWidget {
  final id;

  const ShriAddBox({super.key, required this.id});

  @override
  State<ShriAddBox> createState() => _ShriAddBoxState(id: this.id);
}

class _ShriAddBoxState extends State<ShriAddBox> {
  final id;
  bool loading = false;
  _ShriAddBoxState({required this.id});
  TextEditingController shriinp = TextEditingController();
  addshricall() async {
    if (shriinp.text.isNotEmpty) {
      setState(() {
        loading = true;
      });
      var data = await FbFunc().addShri(id, shriinp.text.toString());
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
    print(id);
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
          onPressed: addshricall,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: !loading
                ? const Text(
                    "Add Now",
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
