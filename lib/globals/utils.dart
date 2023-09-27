import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';


void showSnackBar(BuildContext context, Widget content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: content,
      duration: const Duration(milliseconds: 1000),
    ),
  );
}

void showSnackBarText(BuildContext context, String content,
    {bool fromtop = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      duration: const Duration(milliseconds: 1000),
      behavior: fromtop ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
    ),
  );
}

void showToastedSnackBar(BuildContext context, String content,
    {bool showclose = false,
    String actionlabel = 'dismiss',
    bool isshort = false,
    void Function()? onPressed}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Align(alignment: Alignment.center, child: Text(content)),
      behavior: SnackBarBehavior.floating,
      margin: !isshort
          ? const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 40.0)
          : EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.38,
              right: MediaQuery.of(context).size.width * 0.38,
              bottom: 40.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      dismissDirection: DismissDirection.horizontal,
      backgroundColor:
          Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.8),
      duration: const Duration(seconds: 1),
      elevation: 8.0,
      action: showclose
          ? SnackBarAction(
              label: actionlabel,
              textColor: Theme.of(context).colorScheme.errorContainer,
              onPressed: onPressed ??
                  () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
            )
          : null,
    ),
  );
}

void copyToClipboard(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text));
}

Future<ClipboardData?> pasteFromClipboard(BuildContext context) async {
  return await Clipboard.getData('text/plain');
}

// String? validator({required String? value, required String regex}) {
//   Map<bool, String> isValid = RegexValidator.validate(value!, regex);
//   bool key = isValid.entries.first.key;
//   String message = isValid.entries.first.value;
//   if (value.isEmpty) {
//     return "can't be empty";
//   }
//   if (!key) {
//     return message;
//   }
//   return null;
// }

String formatDateTime(String dateTimeString) {
  try {
    final inputFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ");
    // final outputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    final outputFormat = DateFormat("d MMMM yyyy HH:mm 'hrs'");

    final dateTime = inputFormat.parse(dateTimeString);
    return outputFormat.format(dateTime);
  } catch (e) {
    // Return the original string if there's an error in parsing
    return dateTimeString;
  }
}

launchURL(
    {required BuildContext context,
    required String url,
    LaunchMode mode = LaunchMode.inAppWebView}) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(
      Uri.parse(url),
      mode: mode,
    );
  } else {
    if (context.mounted) {
      showSnackBarText(context, 'Could not launch');
    }

    throw 'Could not launch $url';
  }
}

launchEmail(
    {required BuildContext context,
    required String email,
    required String subject,
    required String body}) async {
  final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': subject, 'body': body});

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    if (context.mounted) {
      showSnackBarText(context, 'Could not launch');
    }

    throw 'Could not launch $emailLaunchUri';
  }
}

lauchFile({required BuildContext context, required String path}) async {
  File file = File(path);
  String filepath = file.absolute.path;
  log(filepath);
  final Uri fileLaunchUri = Uri(scheme: 'file', path: filepath);

  if (await canLaunchUrl(fileLaunchUri)) {
    await launchUrl(fileLaunchUri);
  } else {
    if (context.mounted) {
      showSnackBarText(context, 'Could not launch');
    }

    throw 'Could not launch $fileLaunchUri';
  }
}

makeCall({required BuildContext context, required String number}) async {
  final Uri callLaunchUri = Uri(scheme: 'tel', path: number);

  if (await canLaunchUrl(callLaunchUri)) {
    await launchUrl(callLaunchUri);
  } else {
    if (context.mounted) {
      showSnackBarText(context, 'Could not launch');
    }

    throw 'Could not launch $callLaunchUri';
  }
}

makeSMS(
    {required BuildContext context,
    required String number,
    required body}) async {
  final Uri smsLaunchUri = Uri(
    scheme: 'sms',
    path: number,
    queryParameters: <String, String>{
      'body': Uri.encodeComponent(body.toString()),
    },
  );

  if (await canLaunchUrl(smsLaunchUri)) {
    await launchUrl(smsLaunchUri);
  } else {
    if (context.mounted) {
      showSnackBarText(context, 'Could not launch');
    }

    throw 'Could not launch $smsLaunchUri';
  }
}

showAlertbox(BuildContext context, {Function()? ifTapedYes, String? title}) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title ?? 'Delete File?',
            style: const TextStyle(fontFamily: 'Calleo'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            ElevatedButton(
              onPressed: () {
                ifTapedYes!();
                Navigator.pop(context, true);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.primary),
                elevation: MaterialStateProperty.all<double>(0),
              ),
              child: const Text('Yes'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.error),
                elevation: MaterialStateProperty.all<double>(0),
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('No'),
            ),
          ],
        );
      });
}

Widget infoCard(BuildContext context,
    {String? content, Icon? icon, IconData? iconData, Widget? child}) {
  return Card(
    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon ??
              Icon(
                iconData ?? Icons.lightbulb_outline,
                color: Colors.yellow,
                size: 20,
              ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              content ?? 'write the content here',
              maxLines: 3,
              style: Theme.of(context)
                  .copyWith()
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontFamily: 'Calleo'),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: child ?? const SizedBox.shrink()),
        ],
      ),
    ),
  );
}
customSnackBar({required BuildContext context, required String content}) {
  // return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //   backgroundColor: blackColor,
  //   content: Text(
  //     content,
  //     style: TextStyle(color: whiteColor, letterSpacing: 0.5),
  //   ),
  // ));
  myShowToast(message: content, textColor: Colors.white);
}

void myShowToast({required message, Color? textColor}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 4,
    backgroundColor: Colors.pink,
    textColor: textColor ?? Colors.white,
    fontSize: 16.0,
  );
}
