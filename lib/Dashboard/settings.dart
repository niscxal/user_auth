import 'package:authentication_authorization/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        // title: Text('Settings'),
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
                 Text("Settings", 
                 style: TextStyle(fontSize:20, color:Colors.white))
              ],
            ),
          )
        ),
      ),
      body: ListView(
        children: [
          // Account Section
          ExpansionTile(
            leading: Icon(Icons.person, color: Colors.purple,),
            title: Text('Account'),
            children: [
              ListTile(
                leading: Icon(Icons.shopping_bag, color: Colors.orange,),
                title: Text('Orders'),
                subtitle: Text('View your orders'),
                onTap: () {
                  // Navigate to Orders screen
                },
              ),
              ListTile(
                leading: Icon(Icons.assignment_return, color: Colors.teal,),
                title: Text('Returns'),
                subtitle: Text('Manage your returns'),
                onTap: () {
                  // Navigate to Returns screen
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite, color: Colors.red,),
                title: Text('Wishlist'),
                subtitle: Text('View your wishlist'),
                onTap: () {
                  // Navigate to Wishlist screen
                },
              ),
              ListTile(
                leading: Icon(Icons.payment, color: Colors.green,),
                title: Text('Payment Methods'),
                subtitle: Text('Manage your payment methods'),
                onTap: () {
                  // Navigate to Payment Methods screen
                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet, color: Colors.cyan,),
                title: Text('Wallet'),
                subtitle: Text('View your wallet balance'),
                onTap: () {
                  // Navigate to Wallet screen
                },
              ),
            ],
          ),

          // Settings Section
          ExpansionTile(
            leading: Icon(Icons.settings, color: Colors.purple,),
            title: Text('Settings'),
            children: [
              ListTile(
                leading: Icon(Icons.language, color: Colors.blue,),
                title: Text('Language'),
                subtitle: Text('Change app language'),
                onTap: () {
                  // Navigate to Language settings screen
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on, color: Colors.black,),
                title: Text('Location'),
                subtitle: Text('Manage location settings'),
                onTap: () {
                  // Navigate to Location settings screen
                },
              ),
            ],
          ),

          // Help and Support Section
          ExpansionTile(
            leading: Icon(Icons.help, color: Colors.purple,),
            title: Text('Help & Support'),
            children: [
              ListTile(
                leading: Icon(Icons.live_help, color: Colors.blue,),
                title: Text('Get Help'),
                subtitle: Text('Get assistance'),
                onTap: () {
                  // Navigate to Get Help screen
                },
              ),
              ListTile(
                leading: Icon(Icons.question_answer, color: Colors.green,),
                title: Text('FAQ'),
                subtitle: Text('Frequently Asked Questions'),
                onTap: () {
                  // Navigate to FAQ screen
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: const Color.fromARGB(255, 245, 22, 6),),
                title: Text('Log Out'),
                subtitle: Text('Sign out of your account'),
                onTap: () {
                  // Handle logout
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Placeholder screen for demonstration
class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: Center(
        child: Text('Orders Page'),
      ),
    );
  }
}

// Placeholder screen for Returns
class ReturnsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Returns'),
      ),
      body: Center(
        child: Text('Returns Page'),
      ),
    );
  }
}

// Placeholder screen for Wishlist
class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: Center(
        child: Text('Wishlist Page'),
      ),
    );
  }
}

// Placeholder screen for Payment Methods
class PaymentMethodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Methods'),
      ),
      body: Center(
        child: Text('Payment Methods Page'),
      ),
    );
  }
}

// Placeholder screen for Wallet
class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Center(
        child: Text('Wallet Page'),
      ),
    );
  }
}

// Placeholder screen for Language
class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
      ),
      body: Center(
        child: Text('Language Settings Page'),
      ),
    );
  }
}

// Placeholder screen for Location
class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
        child: Text('Location Settings Page'),
      ),
    );
  }
}

// Placeholder screen for Get Help
class GetHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Help'),
      ),
      body: Center(
        child: Text('Get Help Page'),
      ),
    );
  }
}

// Placeholder screen for FAQ
class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Center(
        child: Text('FAQ Page'),
      ),
    );
  }
}
