import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:world_time_app/screens/home/authenticate/models/xAxis_yAxis_Name.dart';

class AppBarLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: LineChartWidget(),
//         body: Column(
//           children: [
//              Container(
//                child: LineChartWidget(),
//              ),
//             Container(
//               child: Stack(
//                 children: <Widget>[
//                   Positioned(
//                       right: 30,
//                       bottom: 30,
//                       child: Stack(
//                         children: <Widget>[
//                           CircularButton(
//                             color: Colors.blue,
//                             height: 50,
//                             width: 50,
//                             icon: Icon(Icons.menu),
//                             onClick: () {},
//                           ),
//                         ],
//                       ))
//                 ],
//               ),
//             )
//           ],
//         ));
//   }
// }

// class CircularButton extends StatelessWidget {
//   final double width;
//   final double height;
//   final Color color;
//   final Icon icon;
//   final Function onClick;

//   CircularButton({
//     this.color,
//     this.height,
//     this.width,
//     this.icon,
//     this.onClick,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//       width: width,
//       height: height,
//       child: IconButton(
//         icon: icon,
//         enableFeedback: true,
//         onPressed: onClick,
//       ),
//     );
    );
  }
}

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
            minX: 0,
            maxX: 20,
            minY: 0,
            maxY: 14,
            titlesData: LineTilesWidget.getTitleData(),
            gridData: FlGridData(
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              drawVerticalLine: true,
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(3, 6),
                  FlSpot(4, 7),
                  FlSpot(5, 8),
                  FlSpot(6, 9),
                  FlSpot(7, 10),
                  FlSpot(6, 5),
                  FlSpot(8, 11),
                ],
                isCurved: true,
                barWidth: 5,
                dotData: FlDotData(show: false),
              )
            ]),
      );
}
