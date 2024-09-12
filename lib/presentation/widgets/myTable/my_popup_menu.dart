import 'package:flutter/material.dart';
import 'package:mycollege/utils/key_of_storage.dart';
import '../../../utils/constant.dart';
import '../../../utils/def.dart';

class MyPopupMenu extends StatelessWidget {
  const MyPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Widget>(
      menuPadding: const EdgeInsets.all(0),
      color: const Color.fromARGB(207, 255, 255, 255),
      icon: const CircleAvatar(
        child: Icon(Icons.arrow_drop_up),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: const Row(
              children: [
                Text("تعديل الجدول"),
                Icon(Icons.rebase_edit),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text("warning"),
                  content: Text("لسه مشتغلتش"),
                ),
              );
            },
          ),
          PopupMenuItem(
            child: const Row(
              children: [
                Text("حذف الجدول"),
                Icon(Icons.delete),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("warning"),
                  content: const Text("هل تريد تأكيد الحذف"),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          box.clear();
                          secondBox.deleteAll(allDeletedKeys());
                          Navigator.pushNamedAndRemoveUntil(
                              context, homeView, (route) => false);
                        },
                        child: const Text("تأكيد"))
                  ],
                ),
              );
            },
          ),
        ];
      },
    );
  }
}

List allDeletedKeys() {
  List<String>? keys = [];

  for (int i = 0; i < 6; i++) {
    for (int j = 0; j < 4; j++) {
      keys.add(keyOfStorage(i, j));
    }
  }

  return keys;
}
