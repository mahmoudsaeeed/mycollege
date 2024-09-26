import 'package:flutter/material.dart';

myDisKeybaord(context){
  FocusScopeNode currNode = FocusScope.of(context);
            if (currNode.focusedChild != null && !currNode.hasPrimaryFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
}