import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/SharedPreferencesListCubit.dart';
import 'cubit/SharedPreferencesState.dart';

class SharedPreferencesDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Данные:'),
      ),
      body: BlocProvider(
        create: (context) => SharedPreferencesDataCubit(),
        child: BlocBuilder<SharedPreferencesDataCubit, SharedPreferencesState>(
          builder: (context, state) {
            if (state.listFirstValues.isEmpty && state.listSecondValues.isEmpty && state.listSumValues.isEmpty) {
              context.read<SharedPreferencesDataCubit>().loadSharedPreferencesData();
              return const Center(child: CircularProgressIndicator());
            }
            else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: state.listFirstValues.map((item) => Text(item.toString())).toList(),
                  ),
                  const Padding(padding: EdgeInsets.only()),
                  Column(
                    children: state.listSecondValues.map((item) => Text(item.toString())).toList(),
                  ),
                  const Padding(padding: EdgeInsets.only()),
                  Column(
                    children: state.listSumValues.map((item) => Text(item.toString())).toList(),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
