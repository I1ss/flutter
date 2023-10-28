import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/cubit/NasaCubit.dart';
import 'screens/cubit/NasaState.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  ScrollController _scrollController = ScrollController();

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
                _scrollController = ScrollController(initialScrollOffset: state.offset);
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: state.data.photos!.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<NasaCubit>(context).showPhotoDetail(state.data.photos![index].camera, state.data.photos![index].imgSrc, state.data.photos![index].rover, state.data, _scrollController.offset);
                      },
                      child: Card(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    state.data.photos![index].imgSrc!,
                                    fit: BoxFit.cover,
                                    height: 120,
                                    width: 200,
                                  ),
                                  Text('Camera (full name): ${state.data.photos![index].camera?.fullName}'),
                                  Text('Rover: ${state.data.photos![index].rover?.name}'),
                                  Text('Название: ${state.data.photos![index].camera?.name}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              if (state is NasaErrorState) {
                return const Center(child: Text('Произошла ошибка'));
              }
              if (state is PhotoDetailShownState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      state.imgSrc ?? "",
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16),
                    Text('Camera (full name): ${state.camera?.fullName}'),
                    Text('Rover: ${state.rover?.name}'),
                    Text('Название: ${state.camera?.name}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<NasaCubit>(context).showData(state.data, state.offset);
                      },
                      child: const Text('Вернуться'),
                    ),
                  ],
                );
              }
              return const Center(child: Text('Не подгрузилось...'));
            },
          ),
        ),
      ),
    );
  }
}
