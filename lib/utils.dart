import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void go(BuildContext context, Widget w){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => w),
  );
}
void launchURL(_url) async {
  return await canLaunch(_url)
    ? await launch(_url)
    : print('error launching url');
}