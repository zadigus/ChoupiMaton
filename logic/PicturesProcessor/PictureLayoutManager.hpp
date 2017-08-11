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

      void reset(int a_SinglePictureWidth, int a_SinglePictureHeight);
      void addPicture(const QImage& a_Img);

    private:
      bool isFull() const;

      int x() const;
      int y() const;

    signals:
      void layoutFull(const QImage& a_Img);

    private:
      Q_DISABLE_COPY(PictureLayoutManager)

    private:
      static const int NB_COLS;
      static const int NB_ROWS;

      QImage m_Output;
      int m_SinglePictureWidth;
      int m_SinglePictureHeight;
      int m_CurrentPicture;
  };

  //==============================
  // non-member methods
  //==============================
  QImage rotate(const QImage& a_Img);

  //==============================
  // inline methods implementation
  //==============================
  inline PictureLayoutManager::~PictureLayoutManager()
  { }

}

#endif // PICTURESPROCESSOR_PICTURELAYOUTMANAGER_HPP
