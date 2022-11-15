import 'routing/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( BreakingBadApp(appRouting: AppRouting(),));
}

class BreakingBadApp extends StatelessWidget {
   BreakingBadApp({super.key,required this.appRouting});
  AppRouting appRouting;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouting.generteRouting,
      
      theme: ThemeData(
 
        primarySwatch: Colors.blue,
      ),
    
    );
  }
}
  