import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineTilesWidget {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return '2019';
              case 5:
                return '2020';
              case 8:
                return '2021';
            }
            return '';
          },
          margin: 8,
        ),
      );
}
