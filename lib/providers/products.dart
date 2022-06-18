import 'package:flutter/foundation.dart';

import './product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'c1',
      title: 'Anxiety in men: Fighting stereotypes',
      imageUrl: 'assets/images/men_anxiety.jpg',
      description:
          'Anxiety disorders are among the most common mental health conditions worldwide. While they tend to affect women more than men, men are still widely affected. Due to differing social and biological factors, men\'s experiences of anxiety, from coping styles to treatment-seeking behaviors, differ from those of women.',
      hashTag: 'Healthy',
      creatorUrl: 'assets/images/sang2022.jpg',
      creatorName: 'Sang Phan',
      totalView: 279,
      totalStars: 4,
    ),
    Product(
      id: 'c2',
      title: 'Long COVID still a risk, even for vaccinated people',
      imageUrl: 'assets/images/vaccines_covid.jpg',
      description:
          'Long COVID can cause persistent COVID-19 symptoms including loss of smell, fatigue, mood changes, and brain fog in addition to disorders of the heart, kidneys, and lungs. These symptoms emerge or continue at least one month after a SARS-CoV-2 infection\nIt is estimated that 7.7 to 23 million Americans may have developed long COVID, a condition also called post-acute COVID or chronic COVID.\nA study at the Washington University School of Medicine in St. Louis and the Veterans Affairs St. Louis Health Care System suggests that vaccination alone may not be enough to stop breakthrough COVID-19 infectionsTrusted Source and prevent long COVID.\n“Vaccinations remain critically important in the fight against COVID-19 […] But vaccines seem to only provide modest protection against long COVID.”',
      hashTag: 'Healthy',
      creatorUrl: 'assets/images/sang2022.jpg',
      creatorName: 'Dr. Haley',
      totalView: 279,
      totalStars: 4,
    ),
    Product(
      id: 'c3',
      title: 'Arthritis treatment: No evidence that diet helps',
      imageUrl: 'assets/images/diet_osteoarthritis.jpg',
      description:
          'Rheumatic and musculoskeletal diseases (RMD) are a range of conditions that affect peoples\' joints, cause pain, disability, and reduceTrusted Source health-related quality of life.\nWhile some RMDs, such as rheumatoid arthritis, have effective pharmacological treatments to limit disease progression, for others, such as osteoarthritis, existing medications can only alleviate symptoms.\nResearch shows that lifestyle modifications, such as dietary interventions, can reduce the risk of developing many chronic diseasesTrusted Source and may benefit mental health.\nKnowing whether or not lifestyle factors, such as diet, could benefit RMD-related outcomes could help researchers and clinicians prevent or treat RMDs.\nRecently, researchers at the European Alliance of Associations for Rheumatology (EULAR) conducted a review and meta-analysis of studies investigating the effects of diet on the progression of RMDs.\nThey found that no single dietary intervention has substantial benefits for people with RMDs, given current data.',
      hashTag: 'Science',
      creatorUrl: 'assets/images/doctor1.png',
      creatorName: 'Dr. Stephen',
      totalView: 279,
      totalStars: 4,
    ),
    Product(
      id: 'c4',
      title: 'What is mental health?',
      imageUrl: 'assets/images/mental_health.jpg',
      description:
          'The WHO stress that mental health is “more than just the absence of mental disorders or disabilities.” Peak mental health is about not only avoiding active conditions but also looking after ongoing wellness and happiness.\nThey also emphasize that preserving and restoring mental health is crucial on an individual basis, as well as throughout different communities and societies the world over.\nIn the United States, the National Alliance on Mental Illness estimate that almost 1 in 5 adults experience mental health problems each year.\nIn 2017, an estimated 11.2 million adultsTrusted Source in the U.S., or about 4.5% of adults, had a severe psychological condition, according to the National Institute of Mental Health (NIMH).',
      hashTag: 'Culture',
      creatorUrl: 'assets/images/doctor2.png',
      creatorName: 'Dr. Doom',
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

  void addProduct() {
    //_items.add(value)
    notifyListeners();
  }
}
