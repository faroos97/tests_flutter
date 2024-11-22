import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartTest extends StatelessWidget {
  const ChartTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test des Graphiques'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Graphique Linéaire',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 300,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.5),
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.5),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text('Lun');
                            case 2:
                              return const Text('Mer');
                            case 4:
                              return const Text('Ven');
                            case 6:
                              return const Text('Dim');
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 1.2),
                        const FlSpot(1, 1.5),
                        const FlSpot(2, 0.8),
                        const FlSpot(3, 2.0),
                        const FlSpot(4, 1.8),
                        const FlSpot(5, 1.3),
                        const FlSpot(6, 1.7),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blue.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Graphique à Barres',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 300,
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.5),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text('Lun');
                            case 1:
                              return const Text('Mar');
                            case 2:
                              return const Text('Mer');
                            case 3:
                              return const Text('Jeu');
                            case 4:
                              return const Text('Ven');
                            case 5:
                              return const Text('Sam');
                            case 6:
                              return const Text('Dim');
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(toY: 1.2, color: Colors.blue)
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(toY: 1.5, color: Colors.blue)
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(toY: 0.8, color: Colors.blue)
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(toY: 2.0, color: Colors.blue)
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(toY: 1.8, color: Colors.blue)
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(toY: 1.3, color: Colors.blue)
                    ]),
                    BarChartGroupData(x: 6, barRods: [
                      BarChartRodData(toY: 1.7, color: Colors.blue)
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
