part of home_view;

class _Drawer extends GetView<HomeController> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // SizedBox(height: 50),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            color: Colors.grey.shade400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: NetworkImage(_auth.currentUser!.photoURL.toString()),
                      ),
                      shape: BoxShape.circle
                    ),
                  ),
                
                      Text(
                        _auth.currentUser!.displayName.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
              
                      Text(
                        _auth.currentUser!.email.toString(),
                        style: TextStyle(
                            fontSize: 16,),
                      ),
                   
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          ListTile(
            leading: Icon(
              Icons.supervised_user_circle,
            ),
            title: Text("Account"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          ListTile(
            leading: Icon(Icons.file_copy),
            title: Text("Terms & Condtions"),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Invite Friends"),
          ),
          ListTile(
            leading: Icon(Icons.support),
            title: Text("Help"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () => controller.logout(),
          ),
        ],
      ),
    );
  }
}
