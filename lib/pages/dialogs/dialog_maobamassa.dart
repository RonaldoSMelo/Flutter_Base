import 'package:flutter/material.dart';

class DialogCustom extends Dialog {
  DialogCustom(BuildContext context, {super.key})
      : super(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            // ignore: sized_box_for_whitespace
            child: Container(
              width: 300,
              height: 300,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('TituloX'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Fecha Dialog'),
                  )
                ],
              ),
            ));
}
