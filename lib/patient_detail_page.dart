import 'package:flutter/material.dart';

import 'patient_appointment_summary_card.dart';

class PatientDetailPage extends StatefulWidget {
  const PatientDetailPage({super.key, required this.title});

  final String title;

  @override
  State<PatientDetailPage> createState() => _PatientDetailPageState();
}

class _PatientDetailPageState extends State<PatientDetailPage> {
  @override
  void initState() {
    super.initState();
  }

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
                    child: RoomSummary(),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.label_outline,
                size: 35,
                color: primaryColor,
              ),
              const Icon(
                Icons.ac_unit,
                color: Colors.grey,
                size: 30,
              ),
              const Icon(
                Icons.tune,
                size: 30,
                color: Colors.grey,
              ),
              const Icon(
                Icons.perm_identity,
                color: Colors.grey,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getMonth(int index) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'];
    return months[index];
  }
}

class IconButtonWithCircleBorder extends StatelessWidget {
  const IconButtonWithCircleBorder({
    super.key,
    required this.child,
    required this.borderColor,
    this.onTap,
  });

  final Widget child;
  final Color borderColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(color: Colors.white, width: 1),
          ),
        ),
        child: child,
      ),
    );
  }
}

class HealthData extends StatelessWidget {
  const HealthData({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

class HeartRateCard extends StatelessWidget {
  const HeartRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pulso',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFFe1f1ff),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Monthly',
                        style: TextStyle(
                          color: Color(0xFF1389ff),
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Color(0xFF1389ff),
                        size: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://datavizproject.com/wp-content/uploads/types/Line-Graph.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text('Média de batimentos cardiaco: 87 bpm'),
          ],
        ),
      ),
    );
  }
}

class HealthInformationCard extends StatelessWidget {
  const HealthInformationCard({
    super.key,
    required this.title,
    required this.value,
    required this.measurement,
    required this.color,
    required this.icon,
  });

  final Color color;
  final Widget icon;
  final String title;
  final String value;
  final String measurement;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        elevation: 3,
        color: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: color,
                  shape: const CircleBorder(
                    side: BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                child: icon,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                measurement,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RoomSummary extends StatelessWidget {
  const RoomSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.room,
              color: Colors.red,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListTile(
                  title: Text(
                    'Quarto 123',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('0:00 pm - 11:30 pm'),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check_circle,
                    size: 30,
                    color: Color(0xff26e56d),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cancel,
                    size: 30,
                    color: Color(0xffff4077),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
