import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/shared/cubit/cubit.dart';

Widget defualtTextForm (
{
  required TextEditingController controller,
  required String label,
  required TextInputType inputType,
  required Function validation,
  required IconData prefix,
  Function ?onChanged,
  Function ?onSubmitted,
  Function ? onTap,


})

=>TextFormField(
  controller: controller,
  keyboardType: inputType,
 validator: (s)
 {
   validation(s!);
 },

  onTap: ()
  {
    onTap!();
  },
  onChanged: (s)
  {
    onChanged!(s);
  },
  onFieldSubmitted: (s){
    onSubmitted!(s);
  },
decoration: InputDecoration(
labelText: label,
    border: OutlineInputBorder(),
  prefixIcon: Icon(prefix),

),




);

Widget biuldTaskItem(Map model,context) =>Dismissible(
  key: Key(model['id'].toString()),
    child:   Padding(

  
    padding: const EdgeInsets.all(20.0),
  
    child: Row (
  
      children: [
  
  
  
        CircleAvatar(
              backgroundColor: Colors.indigo[400],
          radius: 40,
  
          child:Text('${model['time']}',style: TextStyle(color: Colors.white),),
  
  
  
          ),
  
        SizedBox(
  
          width: 15,
  
        ),
  
        Expanded(
  
          child: Column(
  
            mainAxisSize: MainAxisSize.min,
  
            children: [
  
              Text('${model['title']}',
  
                style: TextStyle(
  
                  fontSize: 16.0,
  
                  fontWeight: FontWeight.bold,
  
                ),
  
              ),
  
              Text('${model['date']}',
  
                style: TextStyle(
  
                  fontWeight: FontWeight.bold,
  
                  color: Colors.grey,
  
                ),
  
              ),
  
  
  
            ],
  
          ),
  
        ),
  
        SizedBox(
  
          width: 15,
  
        ),
  
        IconButton(onPressed: (){
  
          AppCubit.get(context).updateDataBase(status: 'done', id: model['id']);
  
        },
  
            icon: Icon(Icons.check_box,color: Colors.greenAccent,)),
  
        IconButton(onPressed: (){
  
          AppCubit.get(context).updateDataBase(status: 'archieved', id: model['id']);
  
        },
  
            icon: Icon(Icons.archive_outlined,color: Colors.black45,)),
  
  
  
      ],
  
    ),
  
  ),

  onDismissed: (direction) {

       AppCubit.get(context).deleteData(id:(model['id']));
  },

);
Widget builderTask({required List <Map> tasks}) =>ConditionalBuilder(
  condition: tasks.length>0,
  builder:(context)=> ListView.separated(
      itemBuilder: (context, index) => biuldTaskItem(tasks[index],context),
      separatorBuilder: (context, index) => Container(
        width: double.infinity,
        color: Colors.grey,
        height: 1.0,
      ),
      itemCount: tasks.length) ,
  fallback: (context)=>Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.menu,size: 100,color:Colors.grey,),
        Text('No Tasks Yet,Please Add Some Tasks',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey,),)
      ],
    ),
  ),
);
Widget buildArticleItem(article,context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(

        width: 120,
        height: 120,
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image:DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover
          ),
        ),
      ),
      SizedBox(width: 20,),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text('${article['title']}',maxLines: 3,overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1)
              ),
              Text('${article['publishedAt']}',style: TextStyle(
                color: Colors.grey
              ),),
            ],
          ),
        ),
      ),

    ],
  ),
);
Widget separator()=> Container(
width: double.infinity,
color: Colors.grey,
height: 1.0,
);

Widget articleBuilder(list,context)=> ConditionalBuilder(
  condition: list.length>0,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    separatorBuilder: (context, index) => separator(),
    itemBuilder: (context, index) =>
        buildArticleItem(list[index],context),
    itemCount: 9,
  ),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);