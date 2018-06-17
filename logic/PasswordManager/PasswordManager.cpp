#include "PasswordManager.hpp"

#include "common/ConfigHelpers.hpp"

namespace N_PasswordManager {

  //-----------------------------------------------------
  PasswordManager::PasswordManager(QObject* a_Parent)
    : QObject(a_Parent)
    , m_Settings(N_Common::configFilename(), QSettings::IniFormat)
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
