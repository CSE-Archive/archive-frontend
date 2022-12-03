import 'package:cse_archive/views/general_components/appbar_builder.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appbarBuilder(context),
            ],
          ),
        ),
      ),
    );
  }
}
