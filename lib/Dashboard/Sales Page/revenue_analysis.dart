import 'package:authentication_authorization/Dashboard/Sales%20Page/sales.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class RevenueAnalysisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Revenue Analysis'),
        backgroundColor: Colors.purple,
        flexibleSpace: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: IconButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context)=> SalesPage()));
                  }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
                ),
                 Text("Sales", 
                 style: TextStyle(fontSize:20, color:Colors.white))
              ],
            ),
          )
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Revenue Summary Section
            Text(
              'Revenue Overview',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryCard(context, 'Total Revenue', '\$125,000', Colors.green, Icons.attach_money),
                _buildSummaryCard(context, 'Growth Rate', '+12%', Colors.blue, Icons.trending_up),
                _buildSummaryCard(context, 'Avg. Order Value', '\$250', Colors.orange, Icons.shopping_basket),
              ],
            ),
            SizedBox(height: 20),

            // Revenue Trend Line Chart
            Text(
              'Revenue Trends Over Time',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 300,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true, drawVerticalLine: true),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(color: Colors.black, fontSize: 12);
                        String text;
                        switch (value.toInt()) {
                          case 0:
                            text = 'Jan';
                            break;
                          case 1:
                            text = 'Feb';
                            break;
                          case 2:
                            text = 'Mar';
                            break;
                          case 3:
                            text = 'Apr';
                            break;
                          case 4:
                            text = 'May';
                            break;
                          case 5:
                            text = 'Jun';
                            break;
                          default:
                            text = '';
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(text, style: style),
                        );
                      },
                    ),
                    // sideTitles: SideTitles(
                    //   showTitles: true,
                    //   reservedSize: 30,
                    //   getTitlesWidget: (value, meta) {
                    //     return Text('\$${value.toInt() * 1000}', style: const TextStyle(fontSize: 12));
                    //   },
                    // ),
                    )
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(1, 4),
                        FlSpot(2, 5),
                        FlSpot(3, 7),
                        FlSpot(4, 6),
                        FlSpot(5, 8),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      dotData: FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Revenue by Product Category Pie Chart
            Text(
              'Revenue by Product Category',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.blue,
                      value: 40,
                      title: 'Electronics 40%',
                      radius: 60,
                      titleStyle: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    PieChartSectionData(
                      color: Colors.green,
                      value: 30,
                      title: 'Clothing 30%',
                      radius: 60,
                      titleStyle: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    PieChartSectionData(
                      color: Colors.orange,
                      value: 15,
                      title: 'Home 15%',
                      radius: 60,
                      titleStyle: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    PieChartSectionData(
                      color: Colors.red,
                      value: 15,
                      title: 'Other 15%',
                      radius: 60,
                      titleStyle: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Revenue Table
            Text(
              'Revenue Breakdown by Region',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DataTable(
              columns: [
                DataColumn(label: Text('Region')),
                DataColumn(label: Text('Revenue')),
                DataColumn(label: Text('Growth')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('North America')),
                  DataCell(Text('\$50,000')),
                  DataCell(Text('+5%')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Europe')),
                  DataCell(Text('\$40,000')),
                  DataCell(Text('+8%')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Asia')),
                  DataCell(Text('\$25,000')),
                  DataCell(Text('+15%')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, String title, String value, Color color, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(fontSize: 20, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
