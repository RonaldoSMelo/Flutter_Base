import 'package:flutter/material.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  // String texto = '';
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  String categoria = 'Categoria1';

  @override
  void dispose() {
    nameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // TextFormField(
                //   onChanged: (String value) {
                //     setState(() {
                //       texto = value;
                //     });
                //   },
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Text('Texto digitado: $texto'),

                TextFormField(
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    labelStyle:
                        const TextStyle(fontSize: 20, color: Colors.red),
                    isDense: true,
                  ),

                  controller: nameEC,
                  // autovalidateMode: AutovalidateMode.always,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo X não preenchido';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),

                TextFormField(
                  //  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    labelStyle:
                        const TextStyle(fontSize: 20, color: Colors.red),
                    isDense: true,
                  ),
                  obscureText: true,

                  controller: nameEC,
                  // autovalidateMode: AutovalidateMode.always,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo X não preenchido';
                    }
                    return null;
                  },
                ),

                const SizedBox(
                  height: 50,
                ),

                DropdownButtonFormField<String>(
                  value:
                      categoria, // Alterado para corresponder ao value do primeiro item
                  elevation: 16,
                  isDense: true,
                  decoration: InputDecoration(
                    //labelText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    labelStyle:
                        const TextStyle(fontSize: 20, color: Colors.red),
                    isDense: true,
                  ),
                  icon: const Icon(Icons.arrow_back_ios_new_sharp),

                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Categoria não preenchida';
                    }
                    return null;
                  },
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        categoria = newValue;
                      });
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'Categoria1',
                      child: Text('Categoria1'),
                    ),
                    DropdownMenuItem(
                      value: 'Categoria2',
                      child: Text('Categoria2'),
                    ),
                    DropdownMenuItem(
                      value: 'Categoria3',
                      child: Text('Categoria3'),
                    ),
                  ],
                ),

                ElevatedButton(
                    onPressed: () {
                      var formValid = formKey.currentState?.validate() ?? false;
                      var message = 'Formulário Válido (Name: ${nameEC.text})';

                      if (formValid) {
                        message = 'Formulário Válido (Name: ${nameEC.text})';
                      }

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(message)));
                    },
                    child: const Text('Salvar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
