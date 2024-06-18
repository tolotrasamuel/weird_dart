/// background color decides gesture detector
GestureDetector(
      onTap: onTap,
      child: Container(
        // lol if I remove this, gesture detection is gone
        color: Colors.transparent,
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, //add this
                    children: <Widget>[
                      Expanded(
                        child: CachedNetworkImage(
                          // imageUrl:
                          //     "",
                          // width: MediaQuery.of(context).size.width/3,
                          imageUrl: photo.smallUrl,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (isLoading)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              // top right delete button
              Positioned(
                top: -16,
                right: -16,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      if (onChanged != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: GestureDetector(
                            // child: GradientWidget(
                            //   gradient: auraGoldGradient,
                            //   child: Icon(Icons.edit),
                            // ),
                            child: Icon(
                              Icons.edit,
                              shadows: <Shadow>[
                                Shadow(color: Colors.black38, blurRadius: 15.0)
                              ],
                              color: Colors.white,
                              // size: 64,
                            ),
                            onTap: () {
                              onChanged?.call();
                            },
                          ),
                        ),
                      if (onDelete != null)
                        GestureDetector(
                          child: Icon(Icons.delete),
                          onTap: () {
                            onDelete?.call();
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
