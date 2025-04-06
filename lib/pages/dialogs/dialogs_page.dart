import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/pages/dialogs/dialog_maobamassa.dart';

class DialogsPage extends StatelessWidget {
  const DialogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialogs'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => DialogCustom(context),
              );
            },
            child: const Text('Dialog'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text('Simple Dialog'),
                      contentPadding: const EdgeInsets.all(10),
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Lista'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Fecha Dialog'),
                        )
                      ],
                    );
                  });
            },
            child: const Text('SimpleDialog'),
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Alert Dialog'),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Deseja realmente salvar??? '),
                            )
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {}, child: const Text('Cancelar')),
                        TextButton(
                            onPressed: () {}, child: const Text('Salvar'))
                      ],
                    );
                  },
                );
              },
              child: const Text('Alert Dialog')),
          ElevatedButton(
              onPressed: () async {
                final selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                debugPrint('O horario selecionado foi $selectedTime');
              },
              child: const Text('Time Picker')),
          ElevatedButton(
            onPressed: () async {
              final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2026));
              debugPrint('A data selecionado foi $selectedDate');
            },
            child: const Text('Date Picher'),
          ),
          ElevatedButton(
            onPressed: () async {
              showAboutDialog(context: context);
            },
            child: const Text('Show About Dialog'),
          ),
        ],
      )),
    );
  }
}
