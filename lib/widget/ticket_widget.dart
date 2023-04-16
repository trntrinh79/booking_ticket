import 'package:booking_ticket/cubit/ticket_cubit.dart';
import 'package:booking_ticket/model/ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ticketwidget extends StatelessWidget {
  final TicketData ticket;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const Ticketwidget(
      {Key? key,
      required this.ticket,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketCubit, TicketState>(builder: (context, state) {
      return SizedBox(
        height: 200,
        child: InkWell(
          onLongPress: onLongPress,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6),
            child: Card(
              elevation: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        ticket.moviename,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    Text(
                      'Date time: ${ticket.datetime}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Theater: ${ticket.theater}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Seat: ${ticket.seat}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Cinema : ${ticket.cinema}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
          
        
  
//   @override
// Widget build(BuildContext context) {
//   return BlocBuilder<TicketCubit, TicketState>(builder: (context, state) {
//     return SizedBox(
//       height: 200,
//       child: InkWell(
//         onLongPress: onLongPress,
//         onTap: onTap,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6),
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: state.tickets.map((ticket) {
//               return Card(
//                 elevation: 3,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 20, horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Align(
//                         alignment: Alignment.center,
//                         child: Text(
//                           ticket.moviename,
//                           style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 6, horizontal: 12),
//                         child: Divider(
//                           thickness: 2,
//                         ),
//                       ),
//                       Text(
//                         'Date time: ${ticket.datetime}',
//                         style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       Text(
//                         'Theater: ${ticket.theater}',
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w400),
//                       ),
//                       Text(
//                         'Seat: ${ticket.seat}',
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w400),
//                       ),
//                       Text(
//                         'Cinema : ${ticket.cinema}',
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w400),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   });
// }

