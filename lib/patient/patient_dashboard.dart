import 'package:flutter/material.dart';

import '../home/patient_appointment_summary_card.dart';
import '../widgets/custom_bottom_app_bar.dart';
import '../widgets/icon_button_with_circle_border.dart';
import '../widgets/room_summary.dart';
import 'health_data.dart';
import 'health_information_card.dart';
import 'heart_rate_card.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text('Detalhes'),
      ),
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
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
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Avatar(width: 40, height: 40),
                          const Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: ListTile(
                                title: Text(
                                  'name',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  'id',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10),
                              IconButtonWithCircleBorder(
                                borderColor: Colors.white,
                                child: const Icon(
                                  Icons.phone,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                onTap: () {},
                              ),
                              const SizedBox(width: 8),
                              IconButtonWithCircleBorder(
                                borderColor: Colors.white,
                                child: const Icon(
                                  Icons.video_camera_front,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                onTap: () {},
                              ),
                              const SizedBox(width: 8),
                              IconButtonWithCircleBorder(
                                borderColor: Colors.white,
                                child: const Icon(
                                  Icons.messenger_sharp,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HealthData(
                            title: 'Idade: ',
                            value: '27 anos',
                          ),
                          HealthData(
                            title: 'Peso: ',
                            value: '75 Kg',
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HealthData(
                            title: 'Altura: ',
                            value: '178 cm',
                          ),
                          HealthData(
                            title: 'Gordura: ',
                            value: '9.8%',
                          ),
                        ],
                      )
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
                const SizedBox(height: 10),
                const HeartRateCard(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HealthInformationCard(
                      color: const Color(0xFFff0064),
                      icon: Icon(
                        Icons.water_drop_rounded,
                        color: Colors.white,
                      ),
                      title: 'Pressão sanguínea',
                      value: '120/90',
                      measurement: 'mm/Hg',
                    ),
                    HealthInformationCard(
                      color: const Color(0xFF0056fe),
                      icon: Icon(
                        Icons.monitor_heart_rounded,
                        color: Colors.white,
                      ),
                      title: 'Batimento cardíaco',
                      value: '87 bpm',
                      measurement: 'por min',
                    ),
                    HealthInformationCard(
                      color: const Color(0xFF00d87c),
                      icon: Icon(
                        Icons.person_2,
                        color: Colors.white,
                      ),
                      title: 'Glicose no sangue',
                      value: '80-135',
                      measurement: 'mg/dl',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 4,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: const RoomSummary(),
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

  String getMonth(int index) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'];
    return months[index];
  }
}
