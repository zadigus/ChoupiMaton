#include "PasswordManager.hpp"

#include <QStandardPaths>
#include <QDir>

namespace N_PasswordManager {

  //----------------------------------------------------------------------------------------------
  QString configFilename()
  {
    return QDir(QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation)[0]).absoluteFilePath("Password.conf");
  }

  //-----------------------------------------------------
  PasswordManager::PasswordManager(QObject* a_Parent)
    : QObject(a_Parent)
    , m_Settings(configFilename(), QSettings::IniFormat)
  { }

  //-----------------------------------------------------
  PasswordManager::~PasswordManager()
  { }

  //-----------------------------------------------------
  QString PasswordManager::password() const
  {
    m_Settings.beginGroup("Password");
    auto result(m_Settings.value("password", "1234").toString());
    m_Settings.endGroup();
    return result;
  }

  //-----------------------------------------------------
  bool PasswordManager::check(const QString& a_Password) const
  {
    return a_Password == password();
  }

}
