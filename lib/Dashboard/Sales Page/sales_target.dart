import 'package:authentication_authorization/Dashboard/Sales%20Page/sales.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Import for charts

// void main() {
//   runApp(SalesTargetApp());
// }

// class SalesTargetApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sales Target Page',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: SalesTargetPage(),
//     );
//   }
// }

class SalesTargetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Sales Target'),
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
                 Text("Sales Target", 
                 style: TextStyle(fontSize:20, color:Colors.white))
              ],
            ),
          )
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              // Implement filter action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SalesOverviewCard(),
              SizedBox(height: 16),
              SalesProgressChart(),
              SizedBox(height: 16),
              TopPerformersSection(),
              SizedBox(height: 16),
              RecentActivitiesSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesOverviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Sales Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Sales: \$50,000\n' 'Target: \$100,000'),
                // Text('Target: \$100,000\n', maxLines: 2),
                Text('Remaining: \$50,000\n' 'Previous: \$35,000'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SalesProgressChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Progress Towards Target',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          'Day ${value.toInt()}',
                          style:  TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        ));
                      } 
                      
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text('${value.toInt()}%',
                        style:  TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,));
                      } 
                      ),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  
                  borderData: FlBorderData(
                    show: false,
                  ),
                  
                  barGroups: [
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(toY: 30, color: Colors.lightBlueAccent)
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(toY: 50, color: Colors.lightBlueAccent)
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(toY: 40, color: Colors.lightBlueAccent)
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [
                        BarChartRodData(toY: 80, color: Colors.lightBlueAccent)
                      ],
                      showingTooltipIndicators: [0],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopPerformersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Top Performers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: CircleAvatar(child: Text('A')),
              title: Text('Alice Johnson'),
              subtitle: Text('Sales: \$10,000'),
            ),
            ListTile(
              leading: CircleAvatar(child: Text('B')),
              title: Text('Bob Smith'),
              subtitle: Text('Sales: \$9,500'),
            ),
            ListTile(
              leading: CircleAvatar(child: Text('C')),
              title: Text('Charlie Brown'),
              subtitle: Text('Sales: \$9,000'),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentActivitiesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Activities',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Order #1234'),
              subtitle: Text('Completed by Alice Johnson'),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Order #1235'),
              subtitle: Text('Completed by Bob Smith'),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Order #1236'),
              subtitle: Text('Completed by Charlie Brown'),
            ),
          ],
        ),
      ),
    );
  }
}
