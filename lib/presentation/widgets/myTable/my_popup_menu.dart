import 'package:flutter/material.dart';
import '../../../utils/constant.dart';
import '../../../utils/def.dart';

class MyPopupMenu extends StatelessWidget {
  const MyPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Widget>(
      icon: const CircleAvatar(
        child: Icon(Icons.arrow_drop_up),
      ),
      menuPadding: const EdgeInsets.all(10),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: const Text("تعديل الجدول"),
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
            child: const Text("حذف الجدول"),
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
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              homeView,
                              (route) =>false);
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
