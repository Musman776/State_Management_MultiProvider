import 'package:favoriteapp1_state_management/ExampleApp/provider/Example_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    print("scaffold rebuild");
    return Scaffold(
      appBar: AppBar(
          title:const Text("MultiProvider")
      ),

      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // use Consumer to observe the changes only in this widget not rebuild entire scaffold
            // use ExampleProvider Class to get and set the value
            
            Consumer<ExampleProvider>(builder: (context, val, child) {
              print("Slider build");
              return Slider(value: val.value, onChanged: (value){
                val.setValue(value);

              });
            },),

            // use Consumer to rebuild only [Row] widget for value changing
            Consumer<ExampleProvider>(builder: (context, val, child) {
              print("Row rebuild");
              return Row(
                children: [
                  Expanded(
                    child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(val.value)
                        )
                    ),
                  ),

                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(val.value)
                      ),
                    ),
                  ),
                ],
              );
            },),

      ])
    );
  }
}
