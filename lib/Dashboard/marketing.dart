import 'package:authentication_authorization/Dashboard/dashboard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MarketingPage extends StatelessWidget {
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
                 Text("Marketing Dashboard", 
                 style: TextStyle(fontSize:20, color:Colors.white))
              ],
            ),
          )
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white,),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('No new notifications')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Marketing Banner Carousel
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: [
                'marketing_banner_1.jpg',
                'marketing_banner_2.png',
                'marketing_banner_3.png'

              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/$i'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Marketing Insights Section
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Marketing Insights',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Analyze your marketing strategies and see what works best. Track customer engagement and campaign effectiveness in real-time.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Performance Chart
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 300,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 20,
                    barTouchData: BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        // textStyles: const TextStyle(color: Colors.black, fontSize: 12),
                        // margin: 16,
                        // getTitles: (double value) {
                        //   return 'Campaign ${value.toInt()}';
                        // },
                      ),)
                    ),
                    barGroups: [
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(toY: 8, color: Colors.blue)
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(toY: 10, color: Colors.blue)
                      ]),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(toY: 14, color: Colors.blue)
                      ]),
                      BarChartGroupData(x: 4, barRods: [
                        BarChartRodData(toY: 15, color: Colors.blue)
                      ]),
                    ],
                  ),
                ),
              ),
            ),

            // Call-to-Action Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Join Our Marketing Webinar',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Learn the latest marketing strategies and techniques to boost your business growth.',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Action to register for webinar
                        },
                        child: Text('Register Now'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // FAQ Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  // Expand/collapse logic
                },
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text('What is digital marketing?'),
                      );
                    },
                    body: ListTile(
                      title: Text(
                          'Digital marketing refers to marketing efforts that use the internet and electronic devices to reach consumers.'),
                    ),
                    isExpanded: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text('How do I improve my SEO ranking?'),
                      );
                    },
                    body: ListTile(
                      title: Text(
                          'Improving your SEO ranking involves optimizing your website content, improving site speed, and acquiring backlinks.'),
                    ),
                    isExpanded: true,
                  ),
                ],
              ),
            ),

            // Customer Feedback and Testimonials
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customer Testimonials',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Jane Doe'),
                      subtitle: Text(
                          '“Using the marketing strategies from this platform has doubled our sales within three months!”'),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('John Smith'),
                      subtitle: Text(
                          '“The marketing analytics tools are incredibly helpful in understanding customer behavior.”'),
                    ),
                  ),
                ],
              ),
            ),

            // Call-to-Action Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Handle Learn More
                    },
                    child: Text('Learn More'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Get Started
                    },
                    child: Text('Get Started'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
