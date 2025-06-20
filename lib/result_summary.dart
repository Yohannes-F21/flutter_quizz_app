import 'package:flutter/material.dart';

class ResultSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const ResultSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 25, // width of the container
                  height: 25, // height of the container
                  // padding inside the container
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: (data['user_answer'] == data['correct_answer'])
                        ? Color.fromARGB(255, 150, 198, 241)
                        : Color.fromARGB(
                            255,
                            249,
                            133,
                            241,
                          ), // background color
                    shape: BoxShape.circle,
                    // circular border
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 20, // width of the circle
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(209, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${data['user_answer']}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 249, 133, 241),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '${data['correct_answer']}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 150, 198, 241),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
            //  ListTile(
            //   title: Text(data['question'] as String),
            //   subtitle: Text('Your answer: ${data['user_answer']}'),
            //   trailing: Text('Correct answer: ${data['correct_answer']}'),
            // );
          }).toList(),
        ),
      ),
    );
  }
}
