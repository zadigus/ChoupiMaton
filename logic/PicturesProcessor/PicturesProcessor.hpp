#ifndef PICTURESPROCESSOR_PICTURESPROCESSOR_HPP
#define PICTURESPROCESSOR_PICTURESPROCESSOR_HPP

#include "Global.hpp"

#include <QObject>
#include <QImage>

namespace N_PicturesProcessor {
  class PictureSaver;
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

    private:
      Q_DISABLE_COPY(PicturesProcessor)

      QImage getImageFromPath(const QString& a_Path) const;

    private:
      std::unique_ptr<PictureSaver> m_Saver;
  };

}

#endif // PICTURESPROCESSOR_PICTURESPROCESSOR_HPP
