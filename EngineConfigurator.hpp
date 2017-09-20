#ifndef ENGINECONFIGURATOR_HPP
#define ENGINECONFIGURATOR_HPP

namespace N_PicturesProcessor {
  class PicturesProcessor;
}

namespace N_PrinterManager {
  class PrinterManager;
}

namespace N_PasswordManager {
  class PasswordManager;
}

class AppConfiguration;

class QQmlApplicationEngine;
class QUrl;

class EngineConfigurator
{
  public:
    EngineConfigurator(QQmlApplicationEngine& a_Engine);
    virtual ~EngineConfigurator();

    void setupContext();
    void setupSettings();
    void loadQml(const QUrl& a_Path);

  private:
    EngineConfigurator(const EngineConfigurator&) = delete;
    EngineConfigurator& operator=(const EngineConfigurator&) = delete;

    void setupConnections();

  private:
    QQmlApplicationEngine& m_Engine;

    AppConfiguration* m_AppConfig;
    N_PicturesProcessor::PicturesProcessor* m_PicsProc;
    N_PrinterManager::PrinterManager* m_PrinterMgr;
    N_PasswordManager::PasswordManager* m_PasswordMgr;
};

#endif // ENGINECONFIGURATOR_HPP
