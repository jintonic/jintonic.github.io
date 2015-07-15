---
tags: [Qt]
---

![widgets dragged to centralWidget area need to be laid 
out]({{site.exa}}/widgets-dragged-to-centralWidget-area-need-to-be-laid-out.png)

If this is your first time to create a GUI application using the QMainWindow 
widget in the Qt Creator, you may have a hard time to get access to the child 
widgets you dragged into the centralWidget area using the Design mode in Qt 
Creator. For example, you can get access to the statusBar in the main window 
using the following syntax:

``` cpp
ui->statusBar->showMessage("It works!");
```

But you cannot get access to any widget you dragged into the centralWidget as 
shown in the above screen shot:

``` cpp
ui->centralWidget->lineEdit->setText("won't work!"); // this does not work!
```

Two things are wrong in the code snippet above. First of all, the `lineEdit` 
object dragged into the `centralWidget` area is not a child of the 
`centralWidget` unless you lay it out in the `centralWidget`. This is 
illustrated in the screen shot above. The layout icon in front of the 
`centralWidget` has a banned sign on it, indicating that widgets dragged in its 
area are not laid out yet. One can follow the bottom screen shot to layout the 
widgets in the `centralWidget`. Once it is done, those widgets become children 
of the `centralWidget` automatically. Secondly, one can use the `ui` pointer 
provided in the main window to get access to not only direct children of the 
main window but also its grand children directly:

``` cpp
ui->lineEdit->setText("works!");// works after it's laid out in centralWidget
```

![laying out widgets in 
centralWidget]({{site.exa}}/laying-out-widgets-in-centralWidget.png)




