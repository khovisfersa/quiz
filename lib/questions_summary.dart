import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz/data/questions.dart';
import 'package:quizz/utils/item_index.dart';
import 'package:quizz/utils/styled_text.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: ItemIndex(
                        status:
                            (data['question_answer'] == data['user_answer']),
                        data: ((data['question_index'] as int) + 1).toString(),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      StyledText(
                        text: data['question'] as String,
                        color: Colors.white,
                        size: 15,
                      ),
                      const SizedBox(),
                      StyledText(
                          text: (data['user_answer'] as String),
                          color: data['question_answer'] == data['user_answer']
                              ? Colors.green
                              : Colors.red,
                          size: 13),
                      StyledText(
                          text: (data['question_answer'] as String),
                          color: Colors.green,
                          size: 13),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
