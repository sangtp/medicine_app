import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/providers/event.dart';
import 'package:medicine_app/providers/event_provider.dart';
import 'package:medicine_app/screens/admin/manage_doctors_screen.dart';
import 'package:medicine_app/screens/admin/manage_users_screen.dart';
import 'package:medicine_app/screens/admin/mange_articles_screen.dart';
import 'package:medicine_app/screens/admin/statistics_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import './theme.dart';
import '../screens/splash_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/main_page.dart';
import './screens/product_screen.dart';
import './providers/products.dart';
import './providers/doctors.dart';
import './screens/add_product_screen.dart';
import './screens/appointment_confirm_screen.dart';
import './screens/appointment_screen.dart';
import './screens/auth_page.dart';
import './screens/doctor_detail_screen.dart';
import './screens/edit_product_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Doctors(),
        ),
        ChangeNotifierProvider(
          create: (_) => EventProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: greenColor,
            primarySwatch: Colors.green,
            dividerColor: greenColor //Color(0xffe4faf0),
            ),
        home: //const MainPages(),
            StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            }
            if (userSnapshot.hasData) {
              return const MainPages();
            }
            return const RegisterPages();
          },
        ),
        routes: {
          ProductScreen.routeName: (ctx) => ProductScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          DoctorDetailScreen.routeName: (ctx) => DoctorDetailScreen(),
          RegisterPages.routeName: (ctx) => RegisterPages(),
          AppointmentScreen.routeName: (ctx) => AppointmentScreen(),
          AppointmentConfirmScreen.routeName: (ctx) =>
              AppointmentConfirmScreen(),
          AddProductScreen.routeName: (ctx) => AddProductScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
          //Admin Screen
          ManageArticlesScreen.routeName: (ctx) => ManageArticlesScreen(),
          ManageDoctorsScreen.routeName: (ctx) => ManageDoctorsScreen(),
          ManageUsersScreen.routeName: (ctx) => ManageUsersScreen(),
          StatisticsScreen.routeName: (ctx) => StatisticsScreen(),
        },
      ),
    );
  }
}
