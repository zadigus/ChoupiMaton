#include "PictureSaver.hpp"

#include <QStandardPaths>
#include <QDirIterator>
#include <QFileInfo>
#include <QImage>

namespace N_PicturesProcessor {

  const QDir PictureSaver::TARGET_DIR = QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation)[0]; // special to ios
  const QString PictureSaver::FILE_PREFIX = QString::fromStdString("pic");
  const QString PictureSaver::FILE_SEP = QString::fromStdString("-");
  const QString PictureSaver::FILE_EXT = QString::fromStdString(".png");
  const QRegExp PictureSaver::FILENAME_PATTERN = filenamePattern();

  //-----------------------------------------------------
  QRegExp PictureSaver::filenamePattern()
  {
    QStringList pattern;
    pattern << FILE_PREFIX;
    pattern << FILE_SEP;
    pattern << "*";
    return QRegExp(pattern.join(""));
  }

  //-----------------------------------------------------
  PictureSaver::PictureSaver()
  { }

  //-----------------------------------------------------
  int PictureSaver::getImgNbr() const
  {
    QDirIterator it(TARGET_DIR);
    int max(0);
    while(it.hasNext())
    {
      QFileInfo info(it.next());
      if(FILENAME_PATTERN.indexIn(info.baseName()) >= 0)
      {
        auto idx(info.baseName().split(FILE_SEP)[1].toInt());
        if(idx > max)
        {
          max = idx;
        }
      }
    }
    return ++max;
  }

  //-----------------------------------------------------
  QString PictureSaver::filename() const
  {
    QStringList filename;
    filename << FILE_PREFIX;
    filename << FILE_SEP;
    filename << QString::number(getImgNbr());
    filename << FILE_EXT;
    return filename.join("");
  }

  //-----------------------------------------------------
  void PictureSaver::save(const QImage& a_Img) const
  {
    auto targetPath(TARGET_DIR.absoluteFilePath(filename()));
    if(a_Img.save(targetPath))
    {
      qInfo() << "Saved image to path <" << targetPath << ">";
    }
    else
    {
      qCritical() << "Unable to save image to path <" << targetPath << ">";
    }
  }

}
