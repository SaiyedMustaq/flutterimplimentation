import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/utils/Constants.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerPage extends StatefulWidget {
  const PermissionHandlerPage({Key key}) : super(key: key);

  @override
  _PermissionHandlerPageState createState() => _PermissionHandlerPageState();
}

class _PermissionHandlerPageState extends State<PermissionHandlerPage> {
  PermissionStatus statusCamera, statusContact;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          MaterialButton(
            onPressed: () {
              requestPermission(permissionId: 1);
            },
            child: Text(
              'Camera',
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          MaterialButton(
            onPressed: () {
              requestPermission(permissionId: 2);
            },
            child: Text(
              'Contact',
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text(
              'Camera',
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text(
              'Camera',
              style: TextStyle(fontSize: 15.0),
            ),
          )
        ],
      ),
    );
  }

  requestPermission({int permissionId}) async {
    print('REQUEST ID $permissionId');
    switch (permissionId) {
      case 1:
        statusCamera = await Permission.camera.request();
        print('CONTACT PERMISSION $statusCamera');
        if (statusCamera.isPermanentlyDenied) {
          Constants.commonMethod.showSnack(
              context: context,
              message: 'Please enabled camera permission',
              doAction: () => openAppSettings(),
              actionText: 'Allow');
        } else {
          print('CAMERA PERMISSION GRANT');
        }
        setState(() {});
        break;
      case 2:
        statusContact = await Permission.contacts.request();
        print('CONTACT PERMISSION $statusContact');
        if (statusCamera.isPermanentlyDenied) {
          Constants.commonMethod.showSnack(
              context: context,
              message: 'Please enabled contact permission',
              doAction: () => openAppSettings(),
              actionText: 'Allow');
        } else {
          print('CONTACT PERMISSION GRANT');
        }
        setState(() {});
        break;
    }
  }
}
