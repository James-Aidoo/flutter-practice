import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_app/injection_container.dart';
import 'package:flutter_cubit_app/presentation/bloc/stream_test_bloc.dart';
import 'package:flutter_cubit_app/presentation/widget/app_text_large.dart';
import 'package:flutter_cubit_app/presentation/widget/loading.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StreamTestBloc>(
      create: (context) => sl<StreamTestBloc>(),
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.maxFinite, 50),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocBuilder<StreamTestBloc, StreamTestState>(
                    builder: (context, state) {
                      return InkWell(
                        child: const Text('Add'),
                        onTap: () {
                          final data = state is Loaded
                              ? state.data ?? <String>[]
                              : <String>[];
                          data.add('New Data ${Random().nextInt(50)}');
                          context
                              .read<StreamTestBloc>()
                              .add(StreamTestEvent.addData(data));
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          body: BlocBuilder<StreamTestBloc, StreamTestState>(
              builder: (context, state) {
            context.read<StreamTestBloc>().add(const StreamTestEvent.getData());
            if (state is Loaded) {
              print('Current list value ${state.data}');
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return AppTextLarge(text: state.data?[index] ?? '');
                },
              );
            } else if (state is Loading) {
              return const LoadingView();
            } else {
              return const Text('Sad 😟😔');
            }
          }),
        ),
      ),
    );
  }
}
