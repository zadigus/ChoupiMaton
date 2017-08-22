#include "PicturesProcessor.hpp"

#include "PictureSaver.hpp"
#include "PictureLayoutManager.hpp"

#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickImageProvider>

namespace N_PicturesProcessor {

  //-----------------------------------------------------
  PicturesProcessor::PicturesProcessor(QObject* a_Parent)
    : QObject(a_Parent)
    , m_Saver(new PictureSaver(this))
    , m_LayoutMgr(new PictureLayoutManager(this))
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
  void PicturesProcessor::reset(int a_Width, int a_Height, qreal a_ScaleFactor, qreal a_RotationAngle, qreal a_BottomMarginRatio)
  {
    m_LayoutMgr->reset(a_Width, a_Height, a_ScaleFactor, a_RotationAngle, a_BottomMarginRatio);
  }

  //-----------------------------------------------------
  void PicturesProcessor::process(const QString& a_Path)
  {
    qInfo() << "Processing image <" << a_Path << ">";

    auto img(getImageFromPath(a_Path));
    if(!img.isNull())
    {
      m_LayoutMgr->addPicture(img);
    }
  }

  //-----------------------------------------------------
  void PicturesProcessor::save()
  {
    auto output(m_LayoutMgr->getOutput());
    m_Saver->save(output);
  }

  //-----------------------------------------------------
  QString PicturesProcessor::pathToPicture() const
  {
    return m_Saver->getPicturePath();
  }

}
