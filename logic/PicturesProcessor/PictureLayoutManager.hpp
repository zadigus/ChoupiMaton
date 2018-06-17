#ifndef PICTURESPROCESSOR_PICTURELAYOUTMANAGER_HPP
#define PICTURESPROCESSOR_PICTURELAYOUTMANAGER_HPP

#include "Global.hpp"

#include <QObject>
#include <QImage>
#include <QFont>
#include <QSettings>

namespace N_PicturesProcessor {

  class PictureLayoutManager : public QObject
  {
    Q_OBJECT

    public:
      PictureLayoutManager(QObject* a_Parent = Q_NULLPTR);
      ~PictureLayoutManager();

      void reset(int a_SinglePictureWidth, int a_SinglePictureHeight, qreal a_ScaleFactor, qreal a_RotationAngle, qreal a_BottomMarginRatio);
      void addPicture(const QImage& a_Img);
      QImage getOutput() const;

    private:
      int x() const;
      int y() const;

    private:
      Q_DISABLE_COPY(PictureLayoutManager)

      QString getBottomText() const;

      QImage transform(const QImage& a_Img);
      QPoint bottomTextPosition() const;
      QSize size() const;
      int getBottomTextWidth() const;
      void drawBottomText();

    private:
      static const int NB_COLS;
      static const int NB_ROWS;

      mutable QSettings m_Settings;

      QImage m_Output;
      qreal m_ScaleFactor;
      qreal m_RotationAngle;
      qreal m_BottomMarginRatio;
      int m_SinglePictureWidth;
      int m_SinglePictureHeight;
      int m_CurrentPicture;

      QString m_BottomText;
      QFont m_BottomTextFont;
      int m_BottomTextMargin;
  };

  //==============================
  // non-member methods
  //==============================
  QFont getBottomTextFont();
  QString getBottomText();

  //==============================
  // inline methods implementation
  //==============================
  inline PictureLayoutManager::~PictureLayoutManager()
  { }

  inline QImage PictureLayoutManager::getOutput() const
  {
    return m_Output;
  }
}

#endif // PICTURESPROCESSOR_PICTURELAYOUTMANAGER_HPP
