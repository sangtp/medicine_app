import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme.dart';
import '../providers/doctors.dart';
import '../screens/appointment_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/video_call_screen.dart';
import '../screens/voice_call_screen.dart';
import '../widgets/button_primary.dart';
import '../widgets/doctor_schedule_card.dart';

class DoctorDetailScreen extends StatelessWidget {
  static const routeName = '/doctor-detail';
  const DoctorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String doctorId =
        ModalRoute.of(context)!.settings.arguments as String;
    final loadedDoctor = Provider.of<Doctors>(
      context,
      listen: false,
    ).findById(doctorId);
    return Scaffold(
      //backgroundColor: Color(0xffb1d9b2),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/detail_illustration.png'),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: greenColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffb1d9b2),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            loadedDoctor.imageUrl!,
                            height: 120,
                            width: 75,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                loadedDoctor.name!,
                                style: boldTextStyle.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // Text(
                              //   loadedDoctor.title!,
                              //   style: TextStyle(
                              //       color: greyBoldColor.withOpacity(0.7)),
                              // ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: InkWell(
                                      child: SvgPicture.asset(
                                        'assets/icons/phone.svg',
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                VoiceCallScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: InkWell(
                                      child: SvgPicture.asset(
                                        'assets/icons/chat.svg',
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => ChatScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: InkWell(
                                      child: SvgPicture.asset(
                                        'assets/icons/video.svg',
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                VideoCallScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Thông tin chung',
                        style: boldTextStyle.copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        loadedDoctor.description!,
                        style: regularTextStyle.copyWith(height: 1.6),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Lịch hoạt động đang có',
                        style: boldTextStyle.copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DoctorScheduleCard(Colors.amber),
                      const SizedBox(
                        height: 10,
                      ),
                      DoctorScheduleCard(Colors.lightBlue),
                      const SizedBox(
                        height: 10,
                      ),
                      DoctorScheduleCard(Colors.redAccent),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ButtonPrimary(
        text: 'Đặt lịch hẹn',
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AppointmentScreen(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
