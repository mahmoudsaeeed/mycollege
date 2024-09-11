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
                  padding: const EdgeInsets.all(30),
                  color: Colors.grey,
                  child:  Text(S.of(context).table),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
