import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mufeeda/model/models.dart';
import 'package:mufeeda/resource/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import 'colors.dart';

enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();

  /* URL */
  static final resumeDownloadURL =
      '''https://drive.google.com/file/d/1Mr6J3PdpeMfflbIV3Ly9JVZ-gILBn3RY/view?usp=sharing''';

  static final gitSafeC19 = '''https://github.com/jeeva-HBK/SafeC19''';

  // static final gitHermarts = '''https://github.com/jeeva-HBK/SafeC19''';
  static final gitWtIot = '''https://github.com/jeeva-HBK/AutoChem''';
  static final gitAutoStabilizer =
      '''https://github.com/jeeva-HBK/AutoStabilizer''';
  static final gitPAT = '''https://github.com/jeeva-HBK/PAT''';

  // static final gitAVM = '''https://github.com/jeeva-HBK/SafeC19''';

  List<WorkModel> projectList = [
    WorkModel(
        projectTitle: "GenWorks Live",
        image: "assets/svg/GenLive.png",
        projectContent:
            "GenWorks Live is a powerful mobile application designed to revolutionize the way sales teams manage customer relationships and drive revenue growth. With intuitive features and seamless integration, it empowers sales professionals to streamline their workflows, prioritize leads, and close deals efficiently \n\nFeatures: Lead management, Task automation, Location tracking, Contact Insights, Performance analytics etc.",
        link: "https://play.google.com/store/apps/details?id=com.genWorks.CRM",
        tech1: "Flutter",
        tech2: "Google Map",
        tech3: "Figma"),
    WorkModel(
        projectTitle: "GenService",
        image: "assets/svg/GenService.png",
        projectContent:
            "GenService is a comprehensive mobile application designed to empower service teams in delivering exceptional customer experiences and resolving issues efficiently. With advanced features and seamless integration, it enables service professionals to manage tasks, track service requests, and communicate effectively with clients. \n\nFeatures: Service Request Management, Customer Information Management, Appointment Scheduling and tracking, Asset Management etc.",
        link: "https://play.google.com/store/apps/details?id=com.genworks.service",
        tech1: "Flutter",
        tech2: "Google Map",
        tech3: "Figma"),
    WorkModel(
      projectTitle: "Target Learning App",
      image: "assets/svg/TargetLearning.png",
      projectContent:
          '''Target Learning App is a dedicated mobile application designed to support the academic journey of school students up to class 12 and for competitive exams. With a specialized focus on curriculum-aligned courses and resources, it provides a comprehensive platform for students to enhance their understanding, prepare for exams, and excel in their academic pursuits. \n\nFeatures: Interactive Learning Tools, Personalized Study Plans, Offline Access, Analytics etc.''',
      link: "https://play.google.com/store/apps/details?id=com.education.target",
      tech1: "Flutter",
      tech2: "Analytics",
      tech3: "Firebase",
    ),
    WorkModel(
        projectTitle: "Target Parent Eye",
        image: "assets/svg/TargetParent.png",
        projectContent:
            '''Parent Eye is a comprehensive mobile application tailored for parents to monitor and support their children's academic journey effectively. With intuitive features and real-time insights, it provides parents with a holistic view of their child's academic progress and behavior, empowering them to stay informed and engaged in their child's education. \n\nFeatures: Academic Progress Tracking, Behavioral Insights, Parent-Teacher Collaboration, Detailed analytics etc.''',
        link: "https://play.google.com/store/apps/details?id=com.target.parent",
        tech1: "Flutter",
        tech2: "Firebase",
        tech3: "Android(Java)"),
    WorkModel(
      projectTitle: "Inmakes CRM",
      image: "assets/svg/inmakes.png",
      projectContent:
          '''Inmakes CRM is an enterprise-grade sales management application meticulously engineered to optimize sales processes, enhance customer relationships, and drive revenue growth. It offers a scalable and customizable solution tailored to meet the unique needs of businesses. \n\nFeatures: Opportunity Tracking, Data Management and Security, Sales Reporting and Analytics, Contact Management etc. ''',
      link: "https://play.google.com/store/apps/details?id=com.inmakes.crm",
      tech1: "Flutter",
      tech2: "Figma",
    ),
    WorkModel(
        projectTitle: "Emtees Learning App",
        image: "assets/svg/emtees.png",
        projectContent:
            '''Emtees is a sophisticated and user-friendly online learning application designed to facilitate seamless education delivery in the digital age. Tailored for both learners and educators, it serves as a comprehensive platform that providing access to high-quality educational resources anytime, anywhere. \n\nFeatures: Live discussions, Collaborative Tools, Personalized Study Plans, Offline Access, Multimedia Resources, Analytics etc''',
        link: "https://play.google.com/store/apps/details?id=com.metalife.emteesacademy",
        tech1: "Flutter",
        tech2: "Video player",
        tech3: "Real time chat"),
    // WorkModel(
    //     projectTitle: "Emtees Tutor App",
    //     image: "assets/svg/emtees.png",
    //     projectContent:
    //     '''Emtees is a sophisticated and user-friendly online learning application designed to facilitate seamless education delivery in the digital age. Tailored for both learners and educators, it serves as a comprehensive platform that providing access to high-quality educational resources anytime, anywhere. \n\nFeatures: Live discussions, Collaborative Tools, Personalized Study Plans, Offline Access, Multimedia Resources, Analytics etc''',
    //     link: "https://play.google.com/store/apps/details?id=com.metalife.emteestutor",
    //     tech1: "Flutter",
    //     tech2: "Video player",
    //     tech3: "Real time chat"),
    WorkModel(
        projectTitle: "Eduon Learning App",
        image: "assets/svg/eduon.png",
        projectContent:
        '''Eduon is a comprehensive digital platform designed to facilitate remote education, providing users with accessible and interactive learning experiences for competitive exams. With a user-friendly interface and robust features, this app offers a dynamic solution for individuals seeking to enhance their knowledge and skills conveniently from anywhere. \n\nFeatures: Online exams, Collaborative Tools, Personalized Study Plans, Offline Access, Multimedia Resources etc''',
        link: "https://play.google.com/store/apps/details?id=com.elearn.eduon",
        tech1: "Flutter",
        tech2: "Video player"),
    WorkModel(
        projectTitle: "GetFollow",
        image: "assets/svg/NoData.png",
        projectContent:
            '''This application is to store and record the data of tested production product information for future reference. This application can reduce the time and ensure the performance and quality of the QA/QC people. This application let the super admin to track the workers and their performance. Through this application, we can calculate the time spent on every test that was taken to complete by the worker.''',
        link: "https://play.google.com/store/apps/details?id=com.metalife.emteestutor",
        tech1: "AWS",
        tech2: "Flutter",
        tech3: "Location tracking"),
    WorkModel(
        projectTitle: "Roya",
        image: "assets/svg/NoData.png",
        projectContent:
            '''AVM - Automatic Vending Machine is one of Pradeep's stainless steel product. The project is aimed at automating the beverage vending process. It can be done through hardware that controls the main engines and a mobile app (which acts like a PCB display for the unit) that is used to personalize and make beverage. It can also perform several process like Brewing, Boiling,cleansing drum etc . The Engines (hardware) and Mobiel Application communicate using Bluetooth.''',
        link: "https://play.google.com/store/apps/details?id=com.flewup.roya",
        tech1: "Android",
        tech2: "Robotics",
        tech3: "Chat bot"),
  ];

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  downloadResume(context) async {
    await launchUrl(Uri.parse(AppClass.resumeDownloadURL));
  }

  playStoreLink(context, link) async {
    await launchUrl(Uri.parse(link));
  }

  alertDialog(context, title, msg) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: Text(title, style: TxtStyle().boldWhite(context)),
                content: Text(msg),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: AppColors().greenColor),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Okay'))
                ]));
  }

  Future<bool> sendEmail(name, contact, msg) async {
    var url = Uri.https('hbk-portfolio-mailer.web.app', '/sendMail');
    var response = await post(url,
            body: {"name": name, "contactInfo": contact, "message": msg})
        .timeout(Duration(seconds: 10));
    print(response.body);
    return response.statusCode == 200;
  }
}
