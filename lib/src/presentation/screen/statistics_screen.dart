import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            'assets/icons/chart.svg',
          ),
        ),
        title: const Text(
          'STATISTICS',
          style: TextStyle(
            color: Color(0xFFE0966D),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Total profit: ',
                    style: TextStyle(
                      color: Color(0xFFA3A3A3),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: '\$3324.25',
                    style: TextStyle(
                      color: Color(0xFF73D372),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: BarChart(
                BarChartData(
                  backgroundColor: const Color(0xFFF6F6F6),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: [
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                        toY: 50,
                        color: Colors.orange,
                        width: 30,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      )
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(
                        toY: 180,
                        color: Colors.orange,
                        width: 30,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      )
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(
                        toY: 20,
                        color: Colors.orange,
                        width: 30,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      )
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(
                        toY: 120,
                        color: Colors.orange,
                        width: 30,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      )
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(
                        toY: 80,
                        color: Colors.orange,
                        width: 30,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      )
                    ]),
                    BarChartGroupData(x: 6, barRods: [
                      BarChartRodData(
                        toY: 65,
                        color: Colors.orange,
                        width: 30,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      )
                    ]),
                    BarChartGroupData(
                      x: 7,
                      barRods: [
                        BarChartRodData(
                          toY: 100,
                          color: Colors.orange,
                          width: 30,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        )
                      ],
                    ),
                  ],
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 1:
                              return const Text('11.16');
                            case 2:
                              return const Text('11.17');
                            case 3:
                              return const Text('11.18');
                            case 4:
                              return const Text('11.19');
                            case 5:
                              return const Text('11.20');
                            case 6:
                              return const Text('11.21');
                            case 7:
                              return const Text('Today');
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 10:
                              return const Text('\$10');
                            case 34:
                              return const Text('\$34');
                            case 64:
                              return const Text('\$64');
                            case 74:
                              return const Text('\$74');
                            case 95:
                              return const Text('\$95');
                            case 452:
                              return const Text('\$452');
                            case 748:
                              return const Text('\$748');
                            case 967:
                              return const Text('\$967');
                            case 1004:
                              return const Text('\$1004');
                            case 124567:
                              return const Text('\$124567');
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
