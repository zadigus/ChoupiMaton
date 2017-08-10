#include "PicturesProcessor.hpp"

#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickImageProvider>
#include <QImage>
#include <QStandardPaths>
#include <QDir>

#include <QDebug>

namespace N_PicturesProcessor {

  //-----------------------------------------------------
  PicturesProcessor::PicturesProcessor(QObject* a_Parent)
    : QObject(a_Parent)
  {

  }

  //-----------------------------------------------------
  PicturesProcessor::~PicturesProcessor()
  {

  }

  //-----------------------------------------------------
  void PicturesProcessor::process(const QString& a_Path)
  {
    QUrl imgUrl(a_Path);

    if(auto engine = QQmlEngine::contextForObject(this)->engine())
    {
      if(auto imgProvider = dynamic_cast<QQuickImageProvider*>(engine->imageProvider(imgUrl.host())))
      {
        QSize imgSize;
        auto imgId(imgUrl.path().remove(0, 1));
        auto image(imgProvider->requestImage(imgId, &imgSize, imgSize));

        if(!image.isNull())
        {
          qDebug() << "image size = " << image.width() << "x" << image.height();
          QDir targetDir(QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation)[0]); // this is special to ios
          auto targetPath(targetDir.absoluteFilePath("imgId") + QString::fromStdString(".png"));
          qDebug() << "target path = " << targetPath;
          if(image.save(targetPath))
          {
            qDebug() << "Save successful";
          }
          else
          {
            qDebug() << "Save failed";
          }
          // TODO: get number of pics stored in the PicturesLocation and increment that
        }
      }
    }
  }
}
