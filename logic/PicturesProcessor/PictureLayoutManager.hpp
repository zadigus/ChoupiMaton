#ifndef PICTURESPROCESSOR_PICTURELAYOUTMANAGER_HPP
#define PICTURESPROCESSOR_PICTURELAYOUTMANAGER_HPP

#include "Global.hpp"

#include <QObject>
#include <QImage>

namespace N_PicturesProcessor {

  class PictureLayoutManager : public QObject
  {
    Q_OBJECT

    public:
      PictureLayoutManager(QObject* a_Parent = Q_NULLPTR);
      ~PictureLayoutManager();

      void reset(int a_SinglePictureWidth, int a_SinglePictureHeight, qreal a_ScaleFactor, qreal a_RotationAngle, qreal a_BottomMarginRatio);
      void addPicture(const QImage& a_Img);

    private:
      bool isFull() const;

      int x() const;
      int y() const;

    signals:
      void layoutFull(const QImage& a_Img);

    private:
      Q_DISABLE_COPY(PictureLayoutManager)

      QImage transform(const QImage& a_Img);

    private:
      static const int NB_COLS;
      static const int NB_ROWS;

      QImage m_Output;
      qreal m_ScaleFactor;
      qreal m_RotationAngle;
      qreal m_BottomMarginRatio;
      int m_SinglePictureWidth;
      int m_SinglePictureHeight;
      int m_CurrentPicture;
  };

  //==============================
  // non-member methods
  //==============================

  //==============================
  // inline methods implementation
  //==============================
  inline PictureLayoutManager::~PictureLayoutManager()
  { }

}

#endif // PICTURESPROCESSOR_PICTURELAYOUTMANAGER_HPP
