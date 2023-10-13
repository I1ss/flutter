import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Screens/SumScreen.dart';

class FormCalculating extends StatefulWidget {
  @override
  _FormCalculating createState() => _FormCalculating();
}

class _FormCalculating extends State<FormCalculating> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textFieldControllerFirst = TextEditingController();
  final TextEditingController _textFieldControllerSecond = TextEditingController();
  bool _agreement = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _textFieldControllerFirst,
              decoration: InputDecoration(labelText: 'Введите число А:'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
              validator: (value) {
                final cleanedValue = value?.replaceAll(RegExp(r'[^0-9.]'), '');
                if (cleanedValue == null || cleanedValue.isEmpty || double.tryParse(cleanedValue) == null)
                  return 'Необходимо заполнить это поле числом!';
              },
            ),
            TextFormField(
              controller: _textFieldControllerSecond,
              decoration: InputDecoration(labelText: 'Введите число B:'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
              validator: (value) {
                final cleanedValue = value?.replaceAll(RegExp(r'[^0-9.]'), '');
                if (cleanedValue == null || cleanedValue.isEmpty || double.tryParse(cleanedValue) == null)
                  return 'Необходимо заполнить это поле числом!';
              },
            ),
            const Padding(padding: EdgeInsets.all(10)),
            CheckboxListTile(
              value: _agreement,
              title: const Text('Я ознакомлен с документом "Согласие на обработку персональных данных" и даю согласие на обработку моих персональных данных в соответствии с требованиями "Федерального закона О персональных данных №152-ФЗ".'),
              onChanged: (bool? value) => setState(() => _agreement = value!)
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_agreement) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SumScreen(paramFirst: double.parse(_textFieldControllerFirst.text), paramSecond: double.parse(_textFieldControllerSecond.text)),
                        ),
                      );
                    }
                    else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            title: Text('Ошибка'),
                            content: Text('Отметьте чексбокс активным'),
                          );
                        },
                      );
                    }
                  }
                },
                child: const Text('Посчитать сумму квадратов чисел a и b!')
            )
          ],
        ),
      ),
    );
  }
}