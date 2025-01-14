import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerts'),
      ),
      body: Center(
        child: Column(
          children: [
            //Simple Alert
            ElevatedButton(
              onPressed: () => _showSimpleAlert(context),
              child: const Text('Show Simple Alert'),
            ),

            //Confirmation Alert
            ElevatedButton(
              onPressed: () => _showConfirmationAlert(context),
              child: const Text('Show Confirmation Alert'),
            ),

            //Custom Alert
            ElevatedButton(
              onPressed: () => _showCustomAlert(context),
              child: const Text('Show Custom Alert'),
            ),

            //Bottom Sheet
            ElevatedButton(
              onPressed: () => _showBottomSheet(context),
              child: const Text('Show Botton Sheet'),
            ),

            //Snackbar
            ElevatedButton(
              onPressed: () => _showSnackbar(context),
              child: const Text('Show Snackbar'),
            ),

            //Simple Dialog
            ElevatedButton(
              onPressed: () => _showSimpleDialog(context),
              child: const Text('Show Simple Dialog'),
            ),

            //Custom Dialog
            ElevatedButton(
              onPressed: () => _showCustomDialog(context),
              child: const Text('Show Custom Dialog'),
            ),

            //Full Screen Dialog
            ElevatedButton(
              onPressed: () => _showFullScreenDialog(context),
              child: const Text('Show Full Screen Dialog'),
            ),
          ],
        ),
      ),
    );
  }

  //Simple Alert
  void _showSimpleAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Simple Alert'),
            content: const Text('This is a simple alert dialog'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              )
            ],
          );
        });
  }

  //Confirmation Alert
  void _showConfirmationAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmation Alert'),
          content: const Text('This is a confirmation alert dialog'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  //Custom Alert
  void _showCustomAlert(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Custom Alert'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Enter your name:'),
                TextField(),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Submit'),
              ),
            ],
          );
        });
  }

  //Bottom Sheet
  void _showBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 300,
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Bottom Sheet',
                  style: TextStyle(fontSize: 24),
                ),
                const Text('This is a bottom sheet'),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSnackbar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('This is a Snackbar'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'SHOW',
          onPressed: () {
            // Perform some action
          },
        ),
      ),
    );
  }

  void _showSimpleDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Choose your device brand:'),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Samsung'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OnePlus'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Apple'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Nokia'),
            ),
          ],
        );
      },
    );
  }

  void _showCustomDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Custom Dialog', style: TextStyle(fontSize: 24)),
                const TextField(
                  decoration:
                      InputDecoration(hintText: 'This is a custom dialog...'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //Full Screen Dialog
  void _showFullScreenDialog(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FullScreenDialog(),
        fullscreenDialog: true,
      ),
    );
  }
}

class FullScreenDialog extends StatelessWidget {
  const FullScreenDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Dialog'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
      ),
      body: Center(
        child: const Text('This is Full Screen Dialog'),
      ),
    );
  }
}
