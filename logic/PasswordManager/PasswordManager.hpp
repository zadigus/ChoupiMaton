#ifndef PASSWORDMANAGER_PASSWORDMANAGER_HPP
#define PASSWORDMANAGER_PASSWORDMANAGER_HPP

#include "Global.hpp"

#include <QObject>
#include <QSettings>

namespace N_PasswordManager {

  class PasswordManager : public QObject
  {
      Q_OBJECT

    public:
      PasswordManager(QObject* a_Parent = Q_NULLPTR);
      virtual ~PasswordManager();

      Q_INVOKABLE bool check(const QString& a_Password) const;

    private:
      Q_DISABLE_COPY(PasswordManager)

      QString password() const;

    signals:

    private:
      mutable QSettings m_Settings;
  };

  //==============================
  // non-member methods
  //==============================

  //==============================
  // inline methods implementation
  //==============================

}

#endif
