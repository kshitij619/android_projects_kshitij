import 'package:flutter/material.dart';

class ScreenTimeBox extends StatelessWidget {
  const ScreenTimeBox({super.key});

  @override
  Widget build(Object context) {
    return Container(
      width: 412,
      height: 500,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'SCREEN TIME',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 48,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: const Color.fromARGB(255, 129, 129, 129)),
                        ),
                        child: const Text('Thu, June 20',
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: const Color.fromARGB(255, 129, 129, 129),
                          )),
                      child: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              timeData(number: '2:41', text: 'Today', fontSize: 48),
              timeData(number: '0:12', text: 'Last hour'),
              timeData(number: '23', text: 'Phone pickups'),
            ],
          ),
          Image.network(
              width: 412,
              'https://static.vecteezy.com/system/resources/previews/015/742/223/non_2x/trend-up-line-graph-growth-progress-detail-infographic-chart-diagram-suitable-for-business-data-and-market-analysis-line-graph-rising-up-and-grow-business-day-by-day-concept-free-vector.jpg'),
        ],
      ),
    );
  }

  Widget timeData({
    required final String number,
    required final String text,
    final int fontSize = 24,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: TextStyle(
            height: 1,
            fontSize: fontSize.toDouble(),
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
