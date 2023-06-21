
import 'package:flutter/material.dart';

class notesecondpage extends StatefulWidget {

  var title;
  var desc;

  notesecondpage (this.title, this.desc);


  @override
  State<notesecondpage> createState() => _notesecondpageState();
}

class _notesecondpageState extends State<notesecondpage> {

   var titlecontroller = TextEditingController();
   var desccontroller = TextEditingController();
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          title: Text("Notes"),
        ),
        body: Column (
          children: [
            uiheadersecond (),
            BodyContentsecond (widget.title, widget.desc),
          ],
        )

    );
  }

  Widget uiheadersecond () {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration (
                borderRadius: BorderRadius.circular(11),
                color: Colors.black.withOpacity (0.2),
              ),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },

                  child: Icon (Icons.arrow_back_ios_new_outlined, color: Colors.white))),
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration (
                borderRadius: BorderRadius.circular(11),
                color: Colors.black.withOpacity (0.2),
              ),
              child: InkWell(
                  onTap: () {

                    titlecontroller.text = widget.title;
                    desccontroller.text = widget.desc;
                    showBottomSheet( context: context, builder: (BuildContext context) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(

                              controller: titlecontroller,


                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(

                                controller: desccontroller,

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(

                            onPressed: () {




                            }, child: Text('Update'),

                      ),
                          ),
                        ],
                      );
                    },
                    );

                  },
                  child: Icon (Icons.edit_note, color: Colors.white)))
        ],
      ),
    );
  }

  Widget BodyContentsecond (title, desc) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text (title, style: TextStyle(fontSize: 30, color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Text (desc, style: TextStyle(fontSize: 30, color: Colors.white)),
              ),
            ],
          ),
        )

    );
  }
}





