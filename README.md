
# QmlCustomComponents

## Creating Documentation for Custom Components 

**[QDOC](https://doc.qt.io/qt-6/01-qdoc-manual.html)** is a tool used to generate documentation for software projects. It works by extracting QDoc comments from project source files and then formatting these comments as HTML pages or DocBook XML documents.

  - **Step 1 - <ins>Adding comments to Custom Components both in QML and CPP files</ins>**

      A topic command tells QDoc which source code element is being documented. Some topic commands allow you to create documentation pages that aren't tied to any       underlying source code element. When QDoc processes a QDoc comment, it tries to connect the comment to an element in the source code by first looking for a topic command that names the source code element. [Properties and Syntax to write the comments for the files](https://doc.qt.io/qt-6/13-qdoc-commands-topics.html).
      
  - **Step 2 - <ins>Creating QDoc Configuration File</ins>**

      [QDoc Configuration file](https://doc.qt.io/qt-6/21-0-qdoc-configuration.html) is to tell QDoc where to find the source files that contain the QDoc comments. An example of qdocconf file can be found in [minimum.qdocconf](https://doc.qt.io/qt-6/21-1-minimum-qdocconf.html).
      
      Once the qdocconf file is created it has to be placed inside the directory "qdoc" inside the project folder.
   
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
      
          QT Creator -> Edit -> Preferences -> Help -> Documentation -> Add the generated .qch file.

### **How to Edit .qdocconf file present in qdoc directory in AiraaButton Project**

 > "config.qdocconf" located in "QmlComponents" directory, contains the static commands that make up a qdocconf file. 
 
  1. Copy the doc directory from AiraaButton Project to your Project folder.
  2. Change AiraaButton.qdocconf file name inside the doc directory to the name of your project.
  3. There will be a variable called "PROJECT_NAME" inside the file. You must set your project name as its value.
  4. Under QHP Files Commands there will be prefix "qhp.AiraaButton." (line no: 18 - 34), wherein "AiraaButton" should be changed to your project name.
  5. Copy the commands from AiraaButton.pro for creating Documentation files to your .pro file.
  6. Build the project. The Documentation files will be generated in ```QmlComponents -> Builds -> Debug -> Project Name -> Doc``` 

#

## Creating and adding library of the Custom Components to test application.

### Step 1: Create Plugin Project

	          File -> New Project -> Library(Template) -> Qt Quick 2 Extension Plugin

 - Choose "qmake" as the build system and select Minimum required Qt Version "Qt 5.15"

### Step 2: Edit Project File(.pro)

- Remove **myitem.ccp** from SOURCES and **myitem.h** from HEADERS. Click on Save.

		    SOURCES += \
	        untitled_plugin.cpp \
	        myitem.cpp
	        HEADERS += \
	        untitled_plugin.h \
	        myitem.h 				

- Delete the same files from the project folder using File Explorer.

### Step 3: Add Resource File and QML file.

-  **Add Resource File**
	- Right click on the project and select "Add New"
	- Under Qt Template, Select **Qt Resource File**
	- File Name as **qml**
	
- **Add QML File to the Resource File**
	- Right click on the Resource file and Click on "Add New".
	- Under Qt Template, select **QML File(Qt Quick 2)**.
	- Create the file name same as the Project Name.
		- Add the Custom Component Code in the the QML File.
		- Edit the qml dir file (under Other files) as follows:
			- module CustomButton.
			- plugin CustomButton
>	*Both Plugin and Module name should be same as the Project Name.*

### Step 4: Edit plugin.cpp file to register QML type.
- Edit the exisiting QmlRegistertype as follows: **qmlRegisterType<MyItem>(uri, 1, 0, "MyItem");**

				qmlRegisterType(QUrl("qrc:/CustomButton.qml"),uri, 1, 0, "CustomButton");

### Step 5: Build the Project to generate .SO file and qmldir

 -	Right Click on the Project, Click on **Run qmake.**
 -	Right Click on the project, Click on **Build**.

### Step 6: Copy .SO and qmldir file from Build folder.

- Copy both .SO and qmldir file from the build folder and place it inside a folder with the same name as the project name.

### Step 7: Using this Library in the test application.

-	Copy and paste the folder containing .SO and qmldir to the build folder of the test application.
-	import the library using the module name give in the qmldir file.
	>	 Example: import CustomButton 1.0.
- Create an object of the Custom Component in the main.qml
- Run the application. 

#
