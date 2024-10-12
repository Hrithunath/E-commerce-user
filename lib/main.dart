import 'package:e_commerce_shoes/firebase_options.dart';
import 'package:e_commerce_shoes/presentation/bloc/ForgotPassword/forgot_password_bloc.dart';
import 'package:e_commerce_shoes/presentation/bloc/auth_bloc.dart';
import 'package:e_commerce_shoes/presentation/pages/Home.Screen.dart';
import 'package:e_commerce_shoes/presentation/pages/address/add_address.dart';
import 'package:e_commerce_shoes/presentation/pages/address/address.dart';
import 'package:e_commerce_shoes/presentation/pages/orders.dart';
import 'package:e_commerce_shoes/presentation/pages/home.dart';
import 'package:e_commerce_shoes/presentation/pages/recovery.dart';
import 'package:e_commerce_shoes/presentation/pages/signin.dart';
import 'package:e_commerce_shoes/presentation/pages/signup.dart';
import 'package:e_commerce_shoes/presentation/pages/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String get userId {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid ?? ""; // Return an empty string if user is not logged in
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
       
         BlocProvider(
          create: (context) => ForgotPasswordBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ShippedAddress(userId: userId),
          theme: ThemeData(primaryColor: Colors.pink),
          initialRoute: "/",
          routes: {
            "/SplashWrapper": (context) => const SplashWrapper(),
          "/Login": (context) => LoginWrapper(),
          "/Register": (context) => RegisterWrapper(),
          "/Recovery": (context) => Recovery(),
          "/Home": (context) => const HomeWrapper(),
          "/HomeBottom": (context) => const HomeBottomnavigation(),
          "/MyOrders": (context) => const MyOrders(),
          "/ShippedAddress": (context) => ShippedAddress(userId: userId),
          }),
    );
  }
}
