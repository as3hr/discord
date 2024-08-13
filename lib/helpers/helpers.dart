// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:discord/helpers/widgets/indicator.dart';
import 'package:discord/navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

Future<void> loader(Future<void> func, BuildContext context) async {
  try {
    context.loaderOverlay.show(widgetBuilder: (_) => const Indicator());
    await func;
  } catch (error) {
    print('CAUGHT ERROR: $error');
    showToast(error.toString(), context);
  } finally {
    if (context.mounted == true) {
      Future.delayed(const Duration(seconds: 1), () {
        context.loaderOverlay.hide();
      });
    }
  }
}

Future<void> showToast(String message, BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pop(true);
      });

      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    },
  );
}

Future<bool> showConfirmationDialog(String title) async {
  final context = AppNavigation.globalKey.currentContext!;
  return await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          );
        },
      ) ??
      false;
}

//date functions
String formatDate(DateTime date) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(date);

  if (difference.inMinutes <= 1) {
    return 'now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours < 24) {
    if (difference.inHours == 1) {
      return '1 hour ago';
    }
    return '${difference.inHours} hours ago';
  } else if (difference.inDays < 30) {
    if (difference.inDays == 1) {
      return 'yesterday';
    }
    return '${difference.inDays} days ago';
  } else if (difference.inDays < 365) {
    int months = (difference.inDays / 30).floor();
    if (months == 1) {
      return 'last month';
    }
    return '$months months ago';
  } else {
    int years = (difference.inDays / 365).floor();
    if (years == 1) {
      return 'last year';
    }
    return '$years years ago';
  }
}

Future<DateTime?> getDateFromPicker(BuildContext context) async {
  final date = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2028),
  );
  return date;
}
