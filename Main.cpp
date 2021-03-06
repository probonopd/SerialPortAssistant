/*++
Copyright (c) Kang Lin studio, All Rights Reserved

Author:
	Kang Lin(kl222@126.com）

Module Name:

    main.cpp

Abstract:

    This file contains main implement.
 */

#ifdef RABBITCOMMON
    #include "RabbitCommonTools.h"
    #include "FrmUpdater/FrmUpdater.h"
    #include "RabbitCommonDir.h"
#endif
#include "MainWindow.h"
#include <QApplication>
#include <QDir>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    QTranslator translator;
    translator.load(RabbitCommon::CDir::Instance()->GetDirTranslations()
               + "/SerialPortAssistant_" + QLocale::system().name() + ".qm");
    qApp->installTranslator(&translator);

#ifdef RABBITCOMMON
    RabbitCommon::CTools::Instance()->Init();
#endif
    
    a.setApplicationName("SerialPortAssistant");
    a.setApplicationDisplayName(QObject::tr("SerialPort Assistant"));
    
#ifdef RABBITCOMMON 
    CFrmUpdater *pUpdate = new CFrmUpdater(); 
    if(!pUpdate->GenerateUpdateXml()) 
        return 0; 
#endif
    CMainWindow w;
    w.show();

    return a.exec();
}
