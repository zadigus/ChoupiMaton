#ifndef COMMON_CONFIG_HELPERS_HPP
#define COMMON_CONFIG_HELPERS_HPP

#include "Global.hpp"

#include <QString>
#include <QApplication>
#include <QDir>
#include <QStandardPaths>

namespace N_Common {

  QString configFilename();
  QString logFilename();
  QDir appDataLocation();

  //==============================
  // inline methods implementation
  //==============================

  inline QDir appDataLocation()
  {
    return QDir(QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation)[0]); // this is ios-specific
  }

  inline QString configFilename()
  {
    return appDataLocation().absoluteFilePath(QCoreApplication::applicationName().append(".conf"));
  }

  inline QString logFilename()
  {
    return appDataLocation().absoluteFilePath(QCoreApplication::applicationName().append(".log"));
  }
}

#endif
