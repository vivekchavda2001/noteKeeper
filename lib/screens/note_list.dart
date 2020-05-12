import 'package:flutter/material.dart';
import 'package:notekeeper/screens/note_detail.dart';
class NoteList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }

}
class NoteListState extends State<NoteList>{
  int count  = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title:Text("Notes"),leading: Icon(Icons.note),),
     body: getNoteListView(),
     floatingActionButton: FloatingActionButton(
       onPressed: (){
         mNavigateToDetail('Add Note');
       },
       tooltip: "Nalla Pav",
       child: Icon(Icons.add),
     ),
   );
  }
  ListView getNoteListView(){
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(

        itemCount: count,
        itemBuilder: (BuildContext context,int position){
          return Card(
            color: Colors.white,
            elevation: 5.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellowAccent,
                child:Icon(Icons.keyboard_arrow_right),
              ),
              title: Text("Dummy Tile",style: titleStyle),
              subtitle: Text('Dummy date'),
              trailing: Icon(Icons.delete),
              onTap: (){
                mNavigateToDetail('Edit Note');
              },
            ),
          );
        },

    );
  }
  void mNavigateToDetail(String title){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return NoteDetail(title);
    }));
  }
}
