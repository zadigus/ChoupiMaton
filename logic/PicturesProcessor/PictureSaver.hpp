#ifndef PICTURESPROCESSOR_PICTURESAVER_H
#define PICTURESPROCESSOR_PICTURESAVER_H

#include "Global.hpp"

#include <QDir>
#include <QString>
#include <QRegExp>

class QImage;

namespace N_PicturesProcessor {

  class PictureSaver
  {
    public:
      PictureSaver();
      virtual ~PictureSaver();

      void save(const QImage& a_Img) const;

    private:
      PictureSaver(const PictureSaver&) = delete;
      PictureSaver& operator=(const PictureSaver&) = delete;

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
