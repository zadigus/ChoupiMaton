#ifndef PICTURESPROCESSOR_PICTURESPROCESSOR_HPP
#define PICTURESPROCESSOR_PICTURESPROCESSOR_HPP

#include "Global.hpp"

#include <QObject>
#include <QImage>

namespace N_PicturesProcessor {
  class PictureSaver;
  class PictureLayoutManager;
}

namespace N_PicturesProcessor {

  /*
   * The purpose of this class is to process
   * the pictures taken with the camera. It
   * essentially is responsible for saving
   * and printing them
   */

  class PicturesProcessor : public QObject
  {
      Q_OBJECT

    public:
      PicturesProcessor(QObject* a_Parent = Q_NULLPTR);
      virtual ~PicturesProcessor();

      Q_INVOKABLE void process(const QString& a_Path);
      Q_INVOKABLE void reset(int a_Width, int a_Height, qreal a_ScaleFactor, qreal a_RotationAngle, qreal a_BottomMarginRatio);

    private:
      Q_DISABLE_COPY(PicturesProcessor)

      QImage getImageFromPath(const QString& a_Path) const;

    private:
      PictureSaver* m_Saver;
      PictureLayoutManager* m_LayoutMgr;
  };

}

#endif // PICTURESPROCESSOR_PICTURESPROCESSOR_HPP
