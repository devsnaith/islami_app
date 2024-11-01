import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/app_intro/widgets/loading_indicator.dart';
import 'package:islami_app/app_intro/widgets/pulse_icon.dart';
import 'package:islami_app/fetching_data/cubit/fetch_cubit.dart';
import 'package:islami_app/users_displayer/pages/users_list.dart';

class IslamiIntro extends StatelessWidget {
  const IslamiIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FetchCubit, FetchState>(
        builder: (context, state) {
          return state.maybeWhen(
            fetched: (objects) => const UsersList(),
            orElse: () {
              return Stack(
                children: [
                  
                  Image.asset(
                    "assets/images/arabesque.png",
                    repeat: ImageRepeat.repeat,
                    width: double.infinity,
                    height: double.infinity,
                  ),

                  const Center(child: PulsingIcon()),
                  
                  BlocBuilder<FetchCubit, FetchState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const SizedBox(),
                        inProgress: () => const FetchingIndicator("Fetching Data"),
                        fetched: (objects) =>
                            const FetchingIndicator("JSON Fetched"),
                        error: (errorMessage) => FetchingIndicator(errorMessage),
                      );
                    },
                  ),

                ],
              );
            });
          },
        ),
    );
  }
}
