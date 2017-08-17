#include "PictureLayoutManager.hpp"

#include <QPainter>

#include <cmath>

namespace N_PicturesProcessor {

  const int PictureLayoutManager::NB_COLS = 2;
  const int PictureLayoutManager::NB_ROWS = 2;

  //-----------------------------------------------------
  PictureLayoutManager::PictureLayoutManager(QObject* a_Parent)
    : QObject(a_Parent)
    , m_ScaleFactor(0)
    , m_RotationAngle(0)
    , m_BottomMarginRatio(0)
    , m_SinglePictureWidth(0)
    , m_SinglePictureHeight(0)
    , m_CurrentPicture(0)
  { }

  //-----------------------------------------------------
  void PictureLayoutManager::reset(int a_SinglePictureWidth, int a_SinglePictureHeight, qreal a_ScaleFactor, qreal a_RotationAngle, qreal a_BottomMarginRatio)
  {
    m_SinglePictureWidth = a_SinglePictureWidth;
    m_SinglePictureHeight = a_SinglePictureHeight;
    m_CurrentPicture = 0;
    m_ScaleFactor = a_ScaleFactor;
    m_RotationAngle = a_RotationAngle;
    m_BottomMarginRatio = a_BottomMarginRatio;
    int bottomMargin = m_BottomMarginRatio * m_SinglePictureHeight;
    m_Output = QImage(NB_COLS * m_SinglePictureWidth, NB_ROWS * m_SinglePictureHeight + bottomMargin, QImage::Format_ARGB32_Premultiplied);
  }

  //-----------------------------------------------------
  QImage PictureLayoutManager::transform(const QImage& a_Img)
  {
    QTransform transform;
    transform.rotate(m_RotationAngle);
    transform.scale(m_ScaleFactor, m_ScaleFactor);
    return a_Img.transformed(transform);
  }

  //-----------------------------------------------------
  int PictureLayoutManager::x() const
  {
    auto currentCol(m_CurrentPicture % NB_COLS);
    return m_SinglePictureWidth * (currentCol + 1. / 2. * (1 - m_ScaleFactor));
  }

  //-----------------------------------------------------
  int PictureLayoutManager::y() const
  {
    auto currentRow(floor(m_CurrentPicture / NB_COLS));
    return m_SinglePictureHeight * (currentRow + 1. / 2. * (1 - m_ScaleFactor));
  }

  //-----------------------------------------------------
  void PictureLayoutManager::addPicture(const QImage& a_Img)
  {
    if(!m_Output.isNull())
    {
      auto img(transform(a_Img));
      QPainter painter(&m_Output);
      qInfo() << "Drawing picture <" << m_CurrentPicture << "> at (x, y) = (" << x() << ", " << y() << ")";
      painter.drawImage(x(), y(), img);
      ++m_CurrentPicture;
    }
    else
    {
      qCritical() << "Unable to draw into output image!";
    }
  }

}
