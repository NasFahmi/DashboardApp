import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawonkoe/app/theme/colors.dart';

class BarDataPendapatan extends StatelessWidget {
  // final List sixDataPendapatan;
  BarDataPendapatan({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 2000000,
        minY: 0,
        gridData: FlGridData(
          show: false,
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueAccent,
          tooltipRoundedRadius: 8,
          tooltipPadding: EdgeInsets.all(8),
          tooltipMargin: 8,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String value = rod.toY.toString();
            return BarTooltipItem(
              '1-6 September 2023 ${value}',
              TextStyle(
                fontSize: 10.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        )),
        barGroups: [
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 1000000,
                color: AppColors.blueColorPrimary,
                width: 20.w,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.r),
                ),
                backDrawRodData: BackgroundBarChartRodData(
                  fromY: 0,
                  show: true,
                  color: AppColors.BackDataChart,
                  toY: 2000000,
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 700000,
                color: AppColors.blueColorPrimary,
                width: 20.w,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.r),
                ),
                backDrawRodData: BackgroundBarChartRodData(
                  fromY: 0,
                  show: true,
                  color: AppColors.BackDataChart,
                  toY: 2000000,
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: 800000,
                color: AppColors.blueColorPrimary,
                width: 20.w,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.r),
                ),
                backDrawRodData: BackgroundBarChartRodData(
                  fromY: 0,
                  show: true,
                  color: AppColors.BackDataChart,
                  toY: 2000000,
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                toY: 850000,
                color: AppColors.blueColorPrimary,
                width: 20.w,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.r),
                ),
                backDrawRodData: BackgroundBarChartRodData(
                  fromY: 0,
                  show: true,
                  color: AppColors.BackDataChart,
                  toY: 2000000,
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 5,
            barRods: [
              BarChartRodData(
                toY: 890000,
                color: AppColors.blueColorPrimary,
                width: 20.w,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.r),
                ),
                backDrawRodData: BackgroundBarChartRodData(
                  fromY: 0,
                  show: true,
                  color: AppColors.BackDataChart,
                  toY: 2000000,
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 6,
            barRods: [
              BarChartRodData(
                toY: 900000,
                color: AppColors.blueColorPrimary,
                width: 20.w,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.r),
                ),
                backDrawRodData: BackgroundBarChartRodData(
                  fromY: 0,
                  show: true,
                  color: AppColors.BackDataChart,
                  toY: 2000000,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
