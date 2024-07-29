import 'package:flutter/material.dart';
import 'package:plant_doctor/common_problems/problem_detail.dart';
import 'package:plant_doctor/common_problems/models/problem.dart';
import 'package:provider/provider.dart';

class ProblemPage extends StatelessWidget {
  
  const ProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final problemProvider = Provider.of<ProblemProvider>(context);
    final problemMapList = problemProvider.problemMap;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Common Problems'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
                colors: [Color(0xffbbf76e), Color(0xff0b6809)],
                stops: [0.07, 1],
                center: Alignment.bottomCenter,
                radius: 2.0,
                focal: Alignment.bottomCenter,
                focalRadius: 0.1),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: problemMapList.length, 
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => _selectProblem(context, problemMapList[index]),
            child: ProblemView(
              problemImage: problemMapList[index]["problemImg"],
              problemName: problemMapList[index]["problemName"],
              problemSymptoms: problemMapList[index]["problemSymptoms"],
            ),
          ), 
          separatorBuilder: (context, index) => const SizedBox(height: 20),
        ),
      ),
    );
  }
}

void _selectProblem(BuildContext context, Map<dynamic, dynamic> problemMap) {
  Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProblemDetailPage(problemMap: problemMap,)));
}

class ProblemView extends StatelessWidget {
  const ProblemView({
    super.key,
    required this.problemImage,
    required this.problemName,
    required this.problemSymptoms,
  });
  final String problemImage;
  final String problemName;
  final List<String> problemSymptoms;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset(problemImage,)
        ),
        // Card(
        //   child: Center(
        //     child: Padding(
        //       padding: EdgeInsets.all(20.0),
        //       child: Text("psst Ishan sees dead people"),
        //     ),
        //   ),
        // ),
        Expanded(
          child: Column(
            children: [
              
              Text(problemName, style: const TextStyle(fontSize: 15),),
              Text("Symptoms: $problemSymptoms", style: const TextStyle(fontSize: 15),)
            ],
          ),
        ),
      ],
    );
  }
}