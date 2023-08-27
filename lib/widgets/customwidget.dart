import 'package:emf_detector/utils/colors.dart';
import 'package:flutter/material.dart';

Widget customText(String text) {
  return Text(text,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
}

Widget customCounter(double w, String data) {
  return SizedBox(
      width: w / 2,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(data,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
      ]));
}

Widget customButton(
    BuildContext context, String label, void Function()? onPressed) {
  return SizedBox(
    height: 50,
    width: 200,
    child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: const BorderSide()))),
        onPressed: onPressed,
        child: Text(
          label,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        )),
  );
}
