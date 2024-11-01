import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class FetchingIndicator extends StatelessWidget {
  const FetchingIndicator(this.status, {super.key});

  final String status;

  @override
  Widget build(BuildContext context) {

    double bottomPadding = MediaQuery.of(context).size.height / 8;

    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            const SizedBox(width: 50, height: 50,
              child: LoadingIndicator(
                indicatorType: Indicator.ballPulse,
                colors: [Colors.black],
              ),
            ),
            
            Text(status, 
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                ),
              ),
              
          ]),
      ),
    );
  }
}
