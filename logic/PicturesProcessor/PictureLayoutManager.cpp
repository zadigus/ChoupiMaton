#include "PictureLayoutManager.hpp"

#include <QPainter>

#include <cmath>

namespace N_PicturesProcessor {

  const int PictureLayoutManager::NB_COLS = 2;
  const int PictureLayoutManager::NB_ROWS = 2;

  //-----------------------------------------------------
  QImage rotate(const QImage& a_Img)
  {
    QTransform transform;
    transform.rotate(-90);
    return a_Img.transformed(transform);
  }

  //-----------------------------------------------------
  PictureLayoutManager::PictureLayoutManager(QObject* a_Parent)
    : QObject(a_Parent)
    , m_SinglePictureWidth(0)
    , m_SinglePictureHeight(0)
    , m_CurrentPicture(0)
  { }

  //-----------------------------------------------------
  void PictureLayoutManager::reset(int a_SinglePictureWidth, int a_SinglePictureHeight)
  {
    m_SinglePictureWidth = a_SinglePictureWidth;
    m_SinglePictureHeight = a_SinglePictureHeight;
    m_CurrentPicture = 0;
    m_Output = QImage(NB_COLS * m_SinglePictureWidth, NB_ROWS * m_SinglePictureHeight, QImage::Format_ARGB32_Premultiplied);
  }

  //-----------------------------------------------------
  bool PictureLayoutManager::isFull() const
  {
    return m_CurrentPicture == NB_COLS * NB_ROWS;
  }

  //-----------------------------------------------------
  int PictureLayoutManager::x() const
  {
    auto currentCol(m_CurrentPicture % NB_COLS);
    return currentCol * m_SinglePictureWidth;
  }

  //-----------------------------------------------------
  int PictureLayoutManager::y() const
  {
    auto currentRow(floor(m_CurrentPicture / NB_COLS));
    return currentRow * m_SinglePictureHeight;
  }

  //-----------------------------------------------------
  void PictureLayoutManager::addPicture(const QImage& a_Img)
  {
    if(!m_Output.isNull())
    {
      auto img(rotate(a_Img));
      QPainter painter(&m_Output);
      qInfo() << "Drawing picture <" << m_CurrentPicture << "> at (x, y) = (" << x() << ", " << y() << ")";
      painter.drawImage(x(), y(), img);
      ++m_CurrentPicture;

      if(isFull())
      {
        emit layoutFull(m_Output);
      }
    }
    else
    {
      qCritical() << "Unable to draw into output image!";
    }
  }

}
