import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mufeeda/resource/responsive.dart';
import 'package:mufeeda/view/contact/contactMobile.dart';
import 'package:mufeeda/view/contact/contactTab.dart';
import 'package:mufeeda/view/contact/contactWeb.dart';

import '../../resource/colors.dart';

class Contact extends ConsumerStatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  ConsumerState<Contact> createState() => _ContactState();
}


class _ContactState extends ConsumerState<Contact> {

  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: ContactWeb(),
      tabView: ContactTab(),
      mobileView: ContactMobile(),
    );
  }
}


