import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixthlaboratorywork/screens/cubit/NasaCubit.dart';

import 'screens/cubit/NasaState.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nasa by Lebedev G.O.',
      home: Scaffold(
        body: BlocProvider(
          create: (context) => NasaCubit(),
          child: BlocBuilder<NasaCubit, NasaState>(
            builder: (context, state) {
              if (state is NasaLoadingState) {
                BlocProvider.of<NasaCubit>(context).loadData();
                return const Center(child: CircularProgressIndicator());
              }
              if (state is NasaLoadedState) {
                return ListView.builder(
                  itemCount: state.data.photos!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      width: 200,
                      child: Image.network(state.data.photos![index].imgSrc!),
                    );
                  }
                );
              }
              if (state is NasaErrorState) {
                return const Center(child: Text('Произошла ошибка'));
              }
              return const Center(child: Text('Не подгрузилось...'));
            },
          ),
        ),
      ),
    );
  }
}