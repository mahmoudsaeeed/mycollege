import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../../utils/constant.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, myTableView);
                },
                child: Container(
                  padding: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 3, 61, 58),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    S.of(context).table,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
