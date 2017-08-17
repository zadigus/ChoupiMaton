#ifndef PICTURESPROCESSOR_PICTURESAVER_H
#define PICTURESPROCESSOR_PICTURESAVER_H

#include "Global.hpp"

#include <QObject>
#include <QDir>
#include <QString>
#include <QRegExp>

class QImage;

namespace N_PicturesProcessor {

  class PictureSaver : public QObject
  {
    Q_OBJECT

    public:
      PictureSaver(QObject* a_Parent = Q_NULLPTR);
      virtual ~PictureSaver();

      void save(const QImage& a_Img) const;

    private:
      Q_DISABLE_COPY(PictureSaver)

      int getImgNbr() const;
      QString filename() const;

      static QRegExp filenamePattern();

    private:
      static const QDir TARGET_DIR;
      static const QString FILE_PREFIX;
      static const QString FILE_SEP;
      static const QString FILE_EXT;
      static const QRegExp FILENAME_PATTERN; // must be defined last as it depends on the other ones
  };

  //==============================
  // non-member methods
  //==============================

  //==============================
  // inline methods implementation
  //==============================
  inline PictureSaver::~PictureSaver()
  { }

}

#endif // PICTURESPROCESSOR_PICTURESAVER_H
