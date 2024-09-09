import 'package:authentication_authorization/Dashboard/dashboard.dart';
import 'package:authentication_authorization/Dashboard/report_list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        flexibleSpace: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: IconButton(onPressed: (){
                    // Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context)=> Dashboard()));
                  }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
                ),
                 Text("Reports", 
                 style: TextStyle(fontSize:20, color:Colors.white))
              ],
            ),
          )
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.receipt, color: Colors.white),
            onPressed: () {
              // Implement filter action
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ReportList()));
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 16),
                  _buildOverviewCards(),
                  SizedBox(height: 32),
                  Text(
                    'Revenue',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 16),
                  _buildRevenueChart(),
                  SizedBox(height: 32),
                  Text(
                    'User Acquisition',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 16),
                  _buildUserAcquisitionChart(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildInfoCard('Total Users', '10,254', Icons.people, Colors.blue),
        _buildInfoCard('Revenue', '\$45,234', Icons.attach_money, Colors.green),
        _buildInfoCard('Conversion', '3.67%', Icons.trending_up, Colors.orange),
      ],
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueChart() {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                sideTitles: SideTitles(reservedSize: 40,
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta) {
                    switch (value.toInt()) {
                      case 0:
                        return Text("Jan");
                      case 2:
                        return Text("Mar");
                      case 4:
                        return Text('MAY');
                      case 6:
                        return Text('JUL');
                      default:
                        return Text('');
                    }
                  },
                ),)
              ),
              borderData: FlBorderData(show: false),
              minX: 0,
              maxX: 6,
              minY: 0,
              maxY: 6,
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 3),
                    FlSpot(1, 1),
                    FlSpot(2, 4),
                    FlSpot(3, 2),
                    FlSpot(4, 5),
                    FlSpot(5, 3),
                    FlSpot(6, 4),
                  ],
                  isCurved: true,
                  color: Colors.blue,
                  barWidth: 4,
                  belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserAcquisitionChart() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: [
                PieChartSectionData(
                  color: Colors.blue,
                  value: 40,
                  title: '40%',
                  radius: 50,
                  titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  color: Colors.green,
                  value: 30,
                  title: '30%',
                  radius: 50,
                  titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  color: Colors.orange,
                  value: 15,
                  title: '15%',
                  radius: 50,
                  titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  color: Colors.red,
                  value: 15,
                  title: '15%',
                  radius: 50,
                  titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}