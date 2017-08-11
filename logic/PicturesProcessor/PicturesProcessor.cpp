#include "PicturesProcessor.hpp"

#include "PictureSaver.hpp"

#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickImageProvider>

namespace N_PicturesProcessor {

  //-----------------------------------------------------
  PicturesProcessor::PicturesProcessor(QObject* a_Parent)
    : QObject(a_Parent)
    , m_Saver(new PictureSaver)
  { }

  //-----------------------------------------------------
  PicturesProcessor::~PicturesProcessor()
  { }

  //-----------------------------------------------------
  QImage PicturesProcessor::getImageFromPath(const QString& a_Path) const
  {
    QUrl imgUrl(a_Path);
    if(auto engine = QQmlEngine::contextForObject(this)->engine())
    {
      if(auto imgProvider = dynamic_cast<QQuickImageProvider*>(engine->imageProvider(imgUrl.host())))
      {
        QSize imgSize;
        auto imgId(imgUrl.path().remove(0, 1));
        auto image(imgProvider->requestImage(imgId, &imgSize, imgSize));
        return image;
      }
    }
    return QImage();
  }

  //-----------------------------------------------------
  void PicturesProcessor::process(const QString& a_Path)
  {
    qInfo() << "Processing image <" << a_Path << ">";

    auto img(getImageFromPath(a_Path));
    if(!img.isNull())
    {
      m_Saver->save(img);
    }
  }
}
