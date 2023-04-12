import 'package:annai_store/features/loader/cubit/cubit/loader_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationLoader extends StatelessWidget {
  const ApplicationLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaderCubit, LoaderState>(
      builder: (context, state) {
        if (state.loadingState == LoadingState.loading) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 20,
                    height: 20,
                    child: const CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
