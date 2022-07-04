import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/doctors_list.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  String query = '';
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Danh sách bác sĩ',
                      style: boldTextStyle.copyWith(fontSize: 32),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffe4faf0)),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      suffixIcon: query.isNotEmpty
                          ? GestureDetector(
                              child: const Icon(
                                Icons.close,
                                color: greenColor,
                              ),
                              onTap: () {
                                controller.clear();
                                FocusScope.of(context)
                                    .requestFocus(FocusNode()); //out ban phim
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xffb1d9b2),
                      ),
                      hintText: 'Tìm kiếm...',
                      hintStyle: regularTextStyle.copyWith(
                        color: const Color(0xffb1d9b2),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'BÁC SĨ HIỆN CÓ',
                  style: boldTextStyle,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              DoctorsList(),
            ],
          ),
        ),
      ),
    );
  }
}
