import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_health_example/src/features/app/presentation/controllers/home_controller.dart';
import 'package:it_health_example/src/features/app/presentation/pages/home/widgets/blood_presure_card.dart';
import 'package:it_health_example/src/features/domain/entities/blood_pressure_data_entity.dart';

class HomePage extends GetView<HomeController> {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}

class _ResultView extends StatelessWidget {
  final BloodPressureDataEntity data;

  const _ResultView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return BloodPressureCard(data: data);
    });
  }
}

class _NoResultView extends StatelessWidget {
  const _NoResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('No se obtuvieron resultados para este usuario'));
  }
}
