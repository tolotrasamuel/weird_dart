
/// LayoutBuilder does not support returning intrinsic dimensions.
  //// Use Case: AutoSizeText
void showDialogWithLayoutBuilder(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        content: LayoutBuilder(
          builder: (context, constraints){
            return Text("Very loooooong text");
          },
        ),
      );
    });
  }
