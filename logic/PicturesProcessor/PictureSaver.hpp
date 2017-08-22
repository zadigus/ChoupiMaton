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

      QString save(const QImage& a_Img);

      QString getPicturePath() const;

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

      QString m_LastPicturePath;
  };

  //==============================
  // non-member methods
  //==============================

  //==============================
  // inline methods implementation
  //==============================
  inline PictureSaver::~PictureSaver()
  { }

  inline QString PictureSaver::getPicturePath() const
  {
    return m_LastPicturePath;
  }
}

#endif // PICTURESPROCESSOR_PICTURESAVER_H
