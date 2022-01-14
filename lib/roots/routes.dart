import 'package:flutter/material.dart';
import 'package:homeworkonolti/model/telegram_archiver.dart';
import 'package:homeworkonolti/pages/homework.dart';
import 'package:homeworkonolti/pages/reminder.dart';
import 'package:homeworkonolti/pages/telegram_archive.dart';
import 'package:homeworkonolti/pages/archive_file.dart';
import 'package:homeworkonolti/pages/add_contact.dart';
import 'package:homeworkonolti/pages/add_contact_number.dart';

class RouterGenerator {
  static generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => HomePage());
      case "/reminder":
        return MaterialPageRoute(builder: (context) => Reminder());
      case "/telegram":
        return MaterialPageRoute(builder: (context) => TelegramArchive());
      case "/add_contacts":
        return MaterialPageRoute(builder: (context) => AddContacts());
      case "/add_contact_number":
        return MaterialPageRoute(
            builder: (context) => AddContactNumber(
                  qabul: [
                    TelegramArchiver(
                        text: args.toString(), subtitle: args.toString())
                  ],
                ));
    }
  }
}
