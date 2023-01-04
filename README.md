# QmlComponents

# Creating Documentation for Custom Components - Sibi Nikesh

**[QDOC](https://doc.qt.io/qt-6/01-qdoc-manual.html)** is a tool used to generate documentation for software projects. It works by extracting QDoc comments from project source files and then formatting these comments as HTML pages or DocBook XML documents.

  - **Step 1 - <ins>Adding comments to Custom Components both in QML and CPP files</ins>**

      A topic command tells QDoc which source code element is being documented. Some topic commands allow you to create documentation pages that aren't tied to any       underlying source code element. When QDoc processes a QDoc comment, it tries to connect the comment to an element in the source code by first looking for a topic command that names the source code element. [Properties and Syntax to write the comments for the files](https://doc.qt.io/qt-6/13-qdoc-commands-topics.html).
      
  - **Step 2 - <ins>Creating QDoc Configuration File</ins>**

      [QDoc Configuration file](https://doc.qt.io/qt-6/21-0-qdoc-configuration.html) is to tell QDoc where to find the source files that contain the QDoc comments. An example of qdocconf file can be found in [minimum.qdocconf](https://doc.qt.io/qt-6/21-1-minimum-qdocconf.html).
      
      Once the qdocconf file is created it has to be placed inside the directory "qdoc" inside the project folder.
      
        **Note:** *"config.qdocconf," located in the qdoc directory, contains the static commands that make up a qdocconf file. Rename the file with project name to your project name after copying the qdoc directory to your project. Change the commands in the project file so that they correspond to your project.*
      
  - **Step 3 - <ins>Running commands for the generation of Documentation files.</ins>**

      The pathname to your configuration file is passed to QDoc tool. QDoc tool can be found in the installation directory of QT in your local computer.
      Generic path of the Qdoc tool **[$$[QT_INSTALL_QML]/../bin/qdoc]**
      
      To produce the documentation files, use the command below to launch the Qdoc tool and pass the qdocconf file. ($${TARGET} =  Project Name)
      
        $$[QT_INSTALL_QML]/../bin/qdoc ./qdoc/$${TARGET}.qdocconf.
      
  - **Step 4 - <ins>Generating QT Compressed help file to integrate documentation files with Qt creator.</ins>**
      
      In order to add the documentation to Qt creator, QHP file needs to be generated as part of documentation.
      
      **[QHP File](https://doc.qt.io/qt-6/qthelpproject.html):** Qt help project collects all data necessary to generate a compressed help file. Along with the actual help data, like the table of contents, index keywords and help documents, it contains some extra information like a namespace to identify the help file. [Format](https://doc.qt.io/qt-6/22-creating-help-project-files.html)
         
       QHP commands needs to be added below the existing commands of the Project configuration file.
       
       **[QCH File](https://doc.qt.io/qt-6/qthelp-framework.html#generating-qt-help):** The file doc.qch contains all the HTML files in compressed form along with the table of contents and index keywords.
       
       **Command to generate qch file:**
       
         qhelpgenerator $${TARGET}.qhp -o $${TARGET}.qch

  - **Step 5 - <ins> Add the documentation to QT Creator.</ins>**
      
      Navigate to the below settings to add the file.
      
          QT Creator -> Edit -> Preferences -> Helpt -> Documentation -> Add the generated .qch file.
      
