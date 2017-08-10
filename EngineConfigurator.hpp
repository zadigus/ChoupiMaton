#ifndef ENGINECONFIGURATOR_HPP
#define ENGINECONFIGURATOR_HPP

namespace N_PicturesProcessor {
  class PicturesProcessor;
}

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

    N_PicturesProcessor::PicturesProcessor* m_PicsProc;
};

#endif // ENGINECONFIGURATOR_HPP
