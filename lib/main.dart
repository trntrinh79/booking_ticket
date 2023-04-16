// import 'package:booking_ticket/cubit/ticket_cubit.dart';
// import 'package:booking_ticket/model/ticket.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_ticket/cubit/ticket_cubit.dart';
import 'package:booking_ticket/screen/edit_ticket1.dart';
import 'package:booking_ticket/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TicketCubit>(
          create: (_) => TicketCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        home: HomePage(),
      ),
    );
  }
}
