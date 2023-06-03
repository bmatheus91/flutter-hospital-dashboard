import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_hospital_dashboard/widgets/custom_bottom_app_bar.dart';
import '../patient/appointment_card.dart';
import 'patient_appointment_summary_card.dart';
import 'chart_painter.dart';

class HospitalDashboard extends StatefulWidget {
  const HospitalDashboard({super.key});

  @override
  State<HospitalDashboard> createState() => _HospitalDashboardState();
}

class _HospitalDashboardState extends State<HospitalDashboard> {
  late List<double> randomChartValues;

  static const dashboardDataAmount = 16;

  @override
  void initState() {
    super.initState();

    randomChartValues = generateRandomValues(100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        title: const Text('Dashboard'),
        actions: [
          const Icon(Icons.notifications),
          Container(
            width: 50,
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://api.dicebear.com/6.x/bottts/png',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff00ff1d),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color(0xff4d9eff),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Monthly',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_circle,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomPaint(
                              foregroundPainter:
                                  ChartPainter(context, randomChartValues),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: _buildChartLegend(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Appointments',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildCard(context, child: const AppointmentCard()),
                const SizedBox(height: 20),
                const Text(
                  "Today (28 January)",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildCard(
                  context,
                  child: const PatientAppointmentSummaryCard(
                    name: 'Louisa Patel',
                    id: 'ID: AA741',
                    hour: '10:00 pm',
                    isActive: true,
                  ),
                ),
                const SizedBox(height: 8),
                _buildCard(
                  context,
                  child: const PatientAppointmentSummaryCard(
                    name: 'Sara Fuller',
                    id: 'ID: BA953',
                    hour: '11:00 pm',
                  ),
                ),
                const SizedBox(height: 8),
                _buildCard(
                  context,
                  child: const PatientAppointmentSummaryCard(
                    name: 'Javier Fuller',
                    id: 'ID: DD5666',
                    hour: '01:00 pm',
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }

  Widget _buildCard(context, {Widget? child}) {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: child,
      ),
    );
  }

  List<Widget> _buildChartLegend(BuildContext context) {
    List<Widget> legend = [];
    int monthIndex = 0;

    final jump = jumpInterval(context);

    for (double i = 1; i < 16.0; i++) {
      if (i % 2 != 0) {
        legend.add(
          Positioned(
            left: (i * jump) - 10,
            top: 10,
            child: SizedBox(
              height: 30,
              child: Text(
                getMonth(monthIndex++),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }
    }

    return legend.toList();
  }

  String getMonth(int index) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'];
    return months[index];
  }

  double jumpInterval(BuildContext context) {
    return (MediaQuery.of(context).size.width * .9) / randomChartValues.length;
  }

  List<double> generateRandomValues(int max) {
    return List.generate(
      dashboardDataAmount,
      (index) => math.Random().nextInt(100).toDouble(),
    );
  }
}
