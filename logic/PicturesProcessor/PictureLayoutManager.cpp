#include "PictureLayoutManager.hpp"

#include "common/ConfigHelpers.hpp"

#include <QPainter>
#include <QFontDatabase>
#include <QFontMetrics>
#include <QDate>

#include <cmath>

namespace N_PicturesProcessor {

  const int PictureLayoutManager::NB_COLS = 2;
  const int PictureLayoutManager::NB_ROWS = 2;

  //-----------------------------------------------------
  QFont getBottomTextFont()
  {
    auto id(QFontDatabase::addApplicationFont(":/fonts/AlexBrush"));
    QFont result(QFontDatabase::applicationFontFamilies(id).at(0));
    result.setPixelSize(135);
    return result;
  }

  //-----------------------------------------------------
  PictureLayoutManager::PictureLayoutManager(QObject* a_Parent)
    : QObject(a_Parent)
    , m_Settings(N_Common::configFilename(), QSettings::IniFormat)
    , m_ScaleFactor(0)
    , m_RotationAngle(0)
    , m_BottomMarginRatio(0)
    , m_SinglePictureWidth(0)
    , m_SinglePictureHeight(0)
    , m_CurrentPicture(0)
    , m_BottomText(getBottomText())
    , m_BottomTextFont(getBottomTextFont())
    , m_BottomTextMargin(25)
  { }

  //-----------------------------------------------------
  QString PictureLayoutManager::getBottomText() const
  {
    m_Settings.beginGroup("Text");
    auto result(m_Settings.value("pictureBottom", QDate::currentDate().toString("dd.MM.yy")).toString());
    m_Settings.endGroup();
    return result;
  }

  //-----------------------------------------------------
  int PictureLayoutManager::getBottomTextWidth() const
  {
    QFontMetrics metrics(m_BottomTextFont);
    return metrics.tightBoundingRect(m_BottomText).width();
  }

  //-----------------------------------------------------
  QPoint PictureLayoutManager::bottomTextPosition() const
  {
    QPoint result;
    result.setX((size().width() - getBottomTextWidth()) / 2);
    result.setY(m_SinglePictureHeight * NB_ROWS + m_BottomTextMargin);
    return result;
  }

  //-----------------------------------------------------
  QSize PictureLayoutManager::size() const
  {
    auto bottomMargin(m_BottomMarginRatio * m_SinglePictureHeight);
    return QSize(NB_COLS * m_SinglePictureWidth, NB_ROWS * m_SinglePictureHeight + static_cast<int>(bottomMargin));
  }

  //-----------------------------------------------------
  void PictureLayoutManager::drawBottomText()
  {
    QPainter painter(&m_Output);
    painter.setFont(m_BottomTextFont);
    painter.drawText(bottomTextPosition(), m_BottomText);
  }

  //-----------------------------------------------------
  void PictureLayoutManager::reset(int a_SinglePictureWidth, int a_SinglePictureHeight, qreal a_ScaleFactor, qreal a_RotationAngle, qreal a_BottomMarginRatio)
  {
    m_SinglePictureWidth = a_SinglePictureWidth;
    m_SinglePictureHeight = a_SinglePictureHeight;
    m_CurrentPicture = 0;
    m_ScaleFactor = a_ScaleFactor;
    m_RotationAngle = a_RotationAngle;
    m_BottomMarginRatio = a_BottomMarginRatio;
    auto picSize(size());
    m_Output = QImage(picSize.width(), picSize.height(), QImage::Format_ARGB32_Premultiplied);
    drawBottomText();
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
    return static_cast<int>(m_SinglePictureWidth * (currentCol + 1. / 2. * (1 - m_ScaleFactor)));
  }

  //-----------------------------------------------------
  int PictureLayoutManager::y() const
  {
    auto currentRow(floor(m_CurrentPicture / NB_COLS));
    return static_cast<int>(m_SinglePictureHeight * (currentRow + 1. / 2. * (1 - m_ScaleFactor)));
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
