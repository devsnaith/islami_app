import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/fetching_data/cubit/fetch_cubit.dart';

class PulsingIcon extends StatefulWidget {
  const PulsingIcon({super.key});

  @override
  State<StatefulWidget> createState() => _PulsingIcon();
}

class _PulsingIcon extends State<PulsingIcon> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animatedWidth;

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    controller.duration = const Duration(seconds: 1);
    controller.addListener(() {
      if(controller.status != AnimationStatus.completed) {
        setState(() {});
        return;
      }
      BlocProvider.of<FetchCubit>(context).fetchUsers();
    });

    animatedWidth = Tween<double>(begin: -135, end: 0).animate(
      CurvedAnimation(parent: controller, curve: Curves.fastLinearToSlowEaseIn),
    );

    Future.delayed(const Duration(microseconds: 500), () => controller.forward());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 2;
    double iconWidth = (screenWidth < 64 ? 64 : screenWidth) + animatedWidth.value;
    return Image.asset("assets/images/ramadan-icon.png", width: iconWidth);
  }
}