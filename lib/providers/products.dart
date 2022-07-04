import 'package:flutter/foundation.dart';

import './product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'c1',
      title: 'Những điều cần chú ý khi ăn mỳ ăn liền',
      imageUrl: 'assets/images/article1.jpg',
      description:
          'Mỳ ăn liền vốn là một món ăn thay thế ngũ cốc phổ biến, tiện dụng và kinh tế đối với nhiều gia đình. Gần đây, thông tin thường xuyên dùng món ăn này có nguy cơ mắc bệnh, khiến nhiều người vô cùng hoang mang.\nNếu bạn ăn mỳ tươi sau thời gian này đã được tiêu hóa, nhưng với mỳ ăn liền vẫn còn nguyên sợi trong dạ dày. Điều đó chứng tỏ món ăn thông dụng này rất nguy hiểm với cơ thể.\nTrong một thí nghiệm đặc biệt của tiến sỹ Braden Kuo, công tác tại Bệnh viện cộng đồng Massachsetts (Mỹ) cho biết, việc tiêu thụ mỳ ăn liền trên 3 lần mỗi tuần có nguy cơ cao mắc bệnh tiểu đường và tim mạch. Nó còn được cho là một đối thủ "khó xơi" đối với hệ tiêu hóa bởi sau nhiều giờ vào cơ thể, những sợi mì này không dễ gì phân hủy.',
      hashTag: 'Sức khỏe',
      creatorUrl: 'assets/images/man1.png',
      creatorName: 'Sang Phan',
      totalView: 279,
      totalStars: 4,
    ),
    Product(
      id: 'c2',
      title: 'Singapore xác nhận trường hợp nhiễm bệnh đậu mùa khỉ đầu tiên',
      imageUrl: 'assets/images/article2.jpg',
      description:
          'Bộ Y tế Singapore đã xác nhận một trường hợp nhiễm đậu mùa khỉ lây nhiễm từ bên ngoài quốc gia này.\nBệnh nhân mắc bệnh là một tiếp viên hàng không 42 tuổi và có quốc tịch Anh. Bộ Y tế cho biết người đàn ông đã ở Singapore trong khoảng thời gian từ ngày 15 đến 17/6 và ngày 19/6. Vào ngày 20/6, bệnh nhân này có kết quả dương tính với bệnh đậu mùa khỉ.',
      hashTag: 'Sức khỏe',
      creatorUrl: 'assets/images/man3.png',
      creatorName: 'Jobu Tobaki',
      totalView: 279,
      totalStars: 4,
    ),
    Product(
      id: 'c3',
      title:
          'WHO họp khẩn, cân nhắc đậu mùa khỉ là tình trạng khẩn cấp toàn cầu',
      imageUrl: 'assets/images/diet_osteoarthritis.jpg',
      description:
          'Theo Reuters, Tổ chức Y tế Thế giới sẽ quyết định việc tuyên bố đậu mùa khỉ có phải tình trạng khẩn cấp toàn cầu hay không sau cuộc họp này. Trong khi đó, các nhà khoa học hàng đầu ở châu Phi cho rằng đây là cuộc khủng hoảng đã xảy ra trong khu vực liên tục nhiều năm.\nCuộc họp khẩn được tổ chức kín, triệu tập các chuyên gia của Ủy ban Khẩn cấp, sẽ diễn ra vào 12h ngày 23/6 tại Geneva (theo giờ địa phương, khoảng 5h ngày 24/6 theo giờ Việt Nam). Hiện tại, thời gian công bố quyết định đậu mùa khỉ là tình trạng khẩn cấp toàn cầu chưa được xác định.\nThành phần tham dự là các chuyên gia từ những khu vực bị ảnh hưởng nhất. Họ sẽ đưa ra khuyến nghị với Tổng giám đốc WHO Tedros Adhanom Ghebreyesus. Sau đó, người đứng đầu WHO sẽ đưa ra quyết định cuối cùng về việc có nên ban bố tình trạng khẩn cấp toàn cầu hay không.\nHầu hết chuyên gia đều cho rằng bệnh đậu mùa khỉ đang bùng phát phù hợp với tiêu chí của WHO về định nghĩa tình trạng khẩn cấp toàn cầu. Đây là một sự kiện đột ngột và bất thường lan rộng trên phạm vi quốc tế, cần có sự hợp tác xuyên quốc gia.',
      hashTag: 'Khoa học',
      creatorUrl: 'assets/images/girl1.png',
      creatorName: 'Huyền My',
      totalView: 279,
      totalStars: 4,
    ),
    Product(
      id: 'c4',
      title: 'Hãy uống nước khi bị đầy hơi!',
      imageUrl: 'assets/images/article4.jpg',
      description:
          'Khi bạn bị đầy hơi, uống nước nghe có vẻ làm cho vấn đề trở nên tệ hơn, nhưng thực ra là nó có lợi. Khi bạn đang ở chế độ ăn kiêng giàu chất xơ, cơ thể rất cần nước để hoạt động hiệu quả. Nước kết hợp với các chất xơ hòa tan tạo thành một chất gel trong ruột, giúp giảm đầy hơi. Uống nhiều nước cũng làm giảm đầy hơi do mất nước.',
      hashTag: 'Mẹo',
      creatorUrl: 'assets/images/girl3.png',
      creatorName: 'Na Trần',
      totalView: 279,
      totalStars: 3,
    ),
    Product(
      id: 'c5',
      title: 'Uống cà phê để giấc ngủ trưa ngon',
      imageUrl: 'assets/images/article5.jpg',
      description:
          'Khi bạn bị đầy hơi, uống nước nghe có vẻ làm cho vấn đề trở nên tệ hơn, nhưng thực ra là nó có lợi. Khi bạn đang ở chế độ ăn kiêng giàu chất xơ, cơ thể rất cần nước để hoạt động hiệu quả. Nước kết hợp với các chất xơ hòa tan tạo thành một chất gel trong ruột, giúp giảm đầy hơi. Uống nhiều nước cũng làm giảm đầy hơi do mất nước.',
      hashTag: 'Mẹo',
      creatorUrl: 'assets/images/man4.png',
      creatorName: 'Bom Nguyễn',
      totalView: 279,
      totalStars: 3,
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  void addProduct(Product product) {
    final newProduct = Product(
      id: DateTime.now().toString(),
      title: product.title,
      description: product.description,
      imageUrl: product.imageUrl,
      hashTag: product.hashTag,
      creatorUrl: product.creatorUrl,
      creatorName: product.creatorName,
    );
    _items.add(newProduct);
    // _items.insert(0, newProduct);
    notifyListeners();
  }

  void deleteProduct(String id) {
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();

    existingProduct == null;
  }
}
