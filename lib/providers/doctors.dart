import 'package:flutter/material.dart';

import './doctor.dart';

class Doctors with ChangeNotifier {
  final List<Doctor> _items = [
    Doctor(
      id: 'd1',
      name: 'Bác sĩ Võ Thành Nhân',
      title:
          'Trung tâm Tim mạch - Bệnh viện Đa khoa Quốc tế Vinmec Central Park',
      imageUrl: 'assets/images/doctor1.jpg',
      email: 'bsthanhnhan@gmail.com',
      location: 'TP.HCM',
      description:
          'Chuyên gia đầu tiên tại Việt Nam về can thiệp động mạch qua da (TAVI), có 40 năm kinh nghiệm giảng dạy trong lĩnh vực Tim mạch tại Đại học Y dược TP HCM, Bệnh viện Chợ Rẫy.',
      schedules: [
        {
          'month': 'Jun',
          'date': '12',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '13',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '14',
          'time': '9am-12am',
          'type': 'Consultation',
        },
      ],
    ),
    Doctor(
      id: 'd2',
      name: 'Bác sĩ Phạm Nhật An',
      title: 'Trung tâm Nhi - Bệnh viện Đa khoa Quốc tế Vinmec Times City',
      imageUrl: 'assets/images/doctor2.jpg',
      email: 'bsnhatan@gmail.com',
      location: 'Hà Nội',
      description:
          'GS.TS.BS Phạm Nhật An có 45 năm  kinh nghiệm trong lĩnh vực Nhi khoa, đặc biệt chuyên sâu trong khám, chẩn đoán và điều trị các bệnh ở trẻ sơ sinh và trẻ nhỏ; các bệnh truyền nhiễm ở trẻ em.',
      schedules: [
        {
          'month': 'Jun',
          'date': '12',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '13',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '14',
          'time': '9am-12am',
          'type': 'Consultation',
        },
      ],
    ),
    Doctor(
      id: 'd3',
      name: 'Bác sĩ Đặng Thị Huệ',
      title: 'Bác sỹ điều trị khoa Quốc tế, BV TWQĐ 108',
      imageUrl: 'assets/images/doctor3.jpg',
      email: 'bsdangthihue@gmail.com',
      location: 'Đà Nẵng',
      description:
          'Có gần 20 năm kinh nghiệm trong lĩnh vực Xét nghiệm và Huyết học, chuyên môn sâu về xét nghiệm huyết - tủy đồ, xét nghiệm sàng lọc kháng thể bất thường, xét nghiệm nhóm máu khó, phân tích biện luận các kết quả xét nghiệm đông cầm máu... ',
      schedules: [
        {
          'month': 'Jun',
          'date': '12',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '13',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '14',
          'time': '9am-12am',
          'type': 'Consultation',
        },
      ],
    ),
    Doctor(
      id: 'd4',
      name: 'Bác sĩ Lâm Hoàng Cát',
      title: 'BV Nguyễn Tri Phương',
      imageUrl: 'assets/images/doctor4.jpg',
      email: 'bshoangcat@gmail.com',
      location: 'Gia Lai',
      description:
          '1. 2008 đến nay: Giảng viên BM Nội TQ - ĐHYD\n2. 2008 đến nay: Bv Nguyễn Tri Phương',
      schedules: [
        {
          'month': 'Jun',
          'date': '12',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '13',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '14',
          'time': '9am-12am',
          'type': 'Consultation',
        },
      ],
    ),
    Doctor(
      id: 'd5',
      name: 'Bác sĩ Lê Thụy Minh Anh',
      title: 'Bệnh viện Nguyễn Tri Phương',
      imageUrl: 'assets/images/doctor5.jpg',
      email: 'bsminhanh@gmail.com',
      location: 'Cần Thơ',
      description:
          'Năm sinh: 1980\nChuyên khoa: Nội Tim mạch\nHọc hàm, học vị: Bác sĩ chuyên khoa 1\nEmail: ai.bcm@umc.edu. Vn\nKhám chuyên khoa: Tim mạch',
      schedules: [
        {
          'month': 'Jun',
          'date': '12',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '13',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '14',
          'time': '9am-12am',
          'type': 'Consultation',
        },
      ],
    ),
  ];

  List<Doctor> get items {
    return [..._items];
  }

  Doctor findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addDoctor() {
    //_items.add(value)
    notifyListeners();
  }

  void deleteDoctor(String id) {
    final existingDoctorIndex = _items.indexWhere((doc) => doc.id == id);
    var existingDoctor = _items[existingDoctorIndex];
    _items.removeAt(existingDoctorIndex);
    notifyListeners();

    existingDoctor == null;
  }
}
