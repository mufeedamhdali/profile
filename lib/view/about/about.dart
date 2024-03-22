import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mufeeda/resource/responsive.dart';
import 'package:mufeeda/view/about/abourWeb.dart';
import 'package:mufeeda/view/about/aboutMobile.dart';
import 'package:mufeeda/view/about/aboutTab.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: AboutWeb(),
      tabView: AboutTab(),
      mobileView: AboutMobile(),
    );
  }
}
